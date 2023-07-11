CREATE VIEW v_users_detail AS
SELECT 
users.*,
details.id,
details.genre,
details.age,
details.taille,
details.poids
from details join users on details.id_user=users.id_user;