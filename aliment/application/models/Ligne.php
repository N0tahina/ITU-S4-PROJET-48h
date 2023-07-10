<?php
    defined('BASEPATH') OR exit('No direct script access allowed');

    class Ligne extends CI_Model{

        public function getligne($numero){
            $customer = array();
            $sql = "SELECT * FROM ligne  WHERE nom ILIKE '%s%s%s'";
            $sql = sprintf($sql,'%',$numero,'%');
            $query = $this->db->query($sql);
            foreach ($query -> result_array() as $row) {
                $customer[] = $row;
            }
            return $customer;
        }
        public function getarret($ligne){
            $customer = array();
            $sql = "SELECT * FROM v_arret  WHERE idligne = %d";
            $sql = sprintf($sql,$ligne);
            $query = $this->db->query($sql);
            foreach ($query -> result_array() as $row) {
                $customer[] = $row;
            }
            return $customer;
        }
    }
?>

