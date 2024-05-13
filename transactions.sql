# 01 Transaction simples

select @@autocommit;
SET @@autocommit = 0;
show session variables like '%isolation%';						-- consultando se está read ou repeatable no SGBD
set session transaction isolation level read committed;			-- ajustando para read

show databases;
use ecommerce;

start transaction;
		select idSeller, SocialName as Fornecedor, cpf as documento from tabela_seller;
        update tabela_seller set CPF = 123456789 where idSeller = 7;

rollback;																						-- desfaz a atualização antes do commit
commit;	


-------------------------------------------------------------------------------------------------------------------------------------------------------

show tables from ecommerce;
select * from tabela_supplier;







# 02 Transaction com Procedure

delimiter //
create PROCEDURE sql_bug()
	BEGIN
			declare exit handler for sqlexception		-- caso haja um erro nas duas intruções da transaction abaixo, o ROLLBACK é realizado aqui
			begin
				ROLLBACK;
				select 'A transação foi encerrado devido um erro.' as Aviso;
			end;
    
				-- TRANSACTION
				start TRANSACTION;
        
				insert into tabela_supplier (SocialName, CNPJ, Contact)
                values ('Exemplo Transac','833286789123429','219245438');
    
				commit;
    END //

delimiter //

call sql_bug;
select * from tabela_supplier;