From: Eduardo Flach <flach@amcgenesys.com.br>
Subject: Simple http firewall.
Date: Wed, 23 Oct 2002 16:42:09 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DB6ED81.206@amcgenesys.com.br>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060701040305050309080202"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------060701040305050309080202
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hello.
	Here is a simple script to hide a real http server from the
world behind a firewall.
	The firewall machine is connected to the world (192.168.2.0/255.255.255.0, or
"${IP_RANGE_AMC}/${NET_MASK_AMC}") through eth0 (BRIDGE_INTERFACE),
with ip 192.168.2.90 (BRIDGE_IP).
	The second firewall interface, eth1 (LOCAL_INTERFACE) joins a subnetwork
(192.168.2.176/255.255.255.240) and has ip 192.168.2.177 (LOCAL_IP).
	The real http server is running on machine 192.168.2.178 (FLACH).
	I found some examples, but they didn't worked in this case.
	Note that everything is blocked by default (all default policies are DROP).

This is the fraction of the attached file containing the four rules that do the
http firewalling:

#--------beginning----------------------------------------------------------------
IPTABLES=/usr/sbin/iptables

HTTP_PORT=80
BRIDGE_IP=192.168.2.90
LOCAL_IP=192.168.2.177
IP_RANGE_AMC=192.168.2.0
NET_MASK_AMC=24
BRIDGE_INTERFACE=eth0
LOCAL_INTERFACE=eth1

FLACH=192.168.2.178

...

#
"$IPTABLES" --verbose --table mangle	--append PREROUTING	--source "${IP_RANGE_AMC}/${NET_MASK_AMC}"	--destination "${BRIDGE_IP}"			--protocol tcp --dport "$HTTP_PORT" --in-interface "${BRIDGE_INTERFACE}"	--jump ACCEPT
"$IPTABLES" --verbose --table nat	--append PREROUTING	--source "${IP_RANGE_AMC}/${NET_MASK_AMC}"	--destination "${BRIDGE_IP}"			--protocol tcp --dport "$HTTP_PORT" --in-interface "${BRIDGE_INTERFACE}"	--jump DNAT --to-destination "${FLACH}:${HTTP_PORT}"
"$IPTABLES" --verbose --table filter	--append FORWARD	--source "${IP_RANGE_AMC}/${NET_MASK_AMC}"	--destination "${FLACH}"			--protocol tcp --dport "$HTTP_PORT" --in-interface "${BRIDGE_INTERFACE}"	--jump ACCEPT
"$IPTABLES" --verbose --table nat	--append POSTROUTING	--source "${IP_RANGE_AMC}/${NET_MASK_AMC}"	--destination "${FLACH}"			--protocol tcp --dport "$HTTP_PORT" --out-interface "${LOCAL_INTERFACE}"	--jump SNAT --to-source "${LOCAL_IP}"
#
#--------end----------------------------------------------------------------


I hope it helps somebody.

Thanks.

--------------060701040305050309080202
Content-Type: text/plain;
 name="iptables"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline;
 filename="iptables"

# /bin/sh
# description: Inicializacao do "$IPTABLES"
#

. /etc/rc.d/init.d/functions
. /etc/sysconfig/network
	
if [ ${NETWORKING} = "no" ]
then
	exit 0
fi

IPTABLES=/usr/sbin/iptables
MODPROBE=/sbin/modprobe

FTP_PORT=21
SSH_PORT=22
DOMAIN_PORT=53
HTTP_PORT=80
AUTH_PORT=113
SMB_PORTS=137,138,139
RNDC_PORT=953
GDS_DB_PORT=3050
SQUID_PORT=3128
UNCKNOWN_PORT=3360

PORTS_TCP="$FTP_PORT","$SSH_PORT","$DOMAIN_PORT","$AUTH_PORT","$GDS_DB_PORT","$SQUID_PORT","$UNCKNOWN_PORT","$RNDC_PORT","$SMB_PORTS"
PORTS_UDP="$FTP_POR","$SSH_PORT","$DOMAIN_PORT","$AUTH_PORT","$GDS_DB_PORT","$SQUID_PORT","$UNCKNOWN_PORT","$SMB_PORTS"

LOOPBACK_IP=127.0.0.1
BRIDGE_IP=192.168.2.90
LOCAL_IP=192.168.2.177
PROXY_SERVER="$LOCAL_IP"
LOCAL_NETWORK=192.168.2.176
IP_RANGE_GENESYS=192.168.2.176
NET_MASK_GENESYS=28
IP_RANGE_AMC=192.168.2.0
NET_MASK_AMC=24
BRIDGE_INTERFACE=eth0
LOCAL_INTERFACE=eth1

GATEWAY_2=192.168.2.1
SERVER_2=192.168.2.5

FLACH=192.168.2.178
BORNE=192.168.2.179
ALICHMAN=192.168.2.180
CARLIS=192.168.2.181
ANGELO=192.168.2.182
DANIEL=192.168.2.183
RAFAEL=192.168.2.184

case "$1" in
	start)
	gprintf "Iniciando o servi���o de %s: " "IPTables"
	echo
	#
	# Esvazia todas as regras.
	#
	"$IPTABLES" --verbose --table filter	--delete-chain
	"$IPTABLES" --verbose --table nat	--delete-chain
	"$IPTABLES" --verbose --table mangle	--delete-chain
	#
	#
	#
	"$IPTABLES" --verbose --table filter	--flush
	"$IPTABLES" --verbose --table nat	--flush
	"$IPTABLES" --verbose --table mangle	--flush
	#
	# A linha que segue permite o roteamento.
	# Sem ela, n���o h��� roteamento algum.
	# Ap���s um reboot, foi verificado que isto ��� o 
	# suficiente para o funcionamento m���nimo
	# (com m���nima seguran���a tamb���m).
	#
	#"$IPTABLES" --verbose --table nat --append POSTROUTING --source "$IP_RANGE_GENESYS"/"$NET_MASK_GENESYS" --jump SNAT --to-source "$BRIDGE_IP"
	#
	# A partir daqui come���am as restricoes:
	# Em primeiro lugar, bloquear tudo.
	#
	"$IPTABLES" --verbose --table filter	--policy INPUT		DROP
	"$IPTABLES" --verbose --table filter	--policy FORWARD	DROP
	"$IPTABLES" --verbose --table filter	--policy OUTPUT		DROP
	"$IPTABLES" --verbose --table nat	--policy PREROUTING	DROP
	"$IPTABLES" --verbose --table nat	--policy POSTROUTING	DROP
	"$IPTABLES" --verbose --table nat	--policy OUTPUT		DROP
	"$IPTABLES" --verbose --table mangle	--policy PREROUTING	DROP
	"$IPTABLES" --verbose --table mangle	--policy OUTPUT		DROP
	#
	# Nenhuma das tentativas anteriores funcionou.
	# A id���ia agora ��� redirecionar pacotes recebidos em eth0 com destino a porta 80 de 192.168.2.90 para
	# 192.168.2.178.
	# Ap���s uma s���rie extensiva de testes, foi descoberto que a regra para responder a requisi������es icmp
	# deve ser inserida na tabela mangle, cadeia PREROUTING.
	# Depois de mais alguns testes, foi verificado que para iniciar a seq������ncia de respostas icmp ���
	# necess���rio inserir uma entrada na tabela nat, cadeia PREROUTING.
	# Depois que a conex���o foi estabalecida ��� que ��� necess���rio a entrada na tabela mangle,
	# cadeia PREROUTING.
	# As tr���s regras a seguir ilustram este fato.
	#
	"$IPTABLES" --verbose --table filter --append INPUT --in-interface "${BRIDGE_INTERFACE}" --source "${IP_RANGE_AMC}/${NET_MASK_AMC}" --destination "${BRIDGE_IP}" --protocol icmp --jump ACCEPT
	"$IPTABLES" --verbose --table nat --append PREROUTING --in-interface "${BRIDGE_INTERFACE}" --source "${IP_RANGE_AMC}/${NET_MASK_AMC}" --destination "${BRIDGE_IP}" --protocol icmp --jump ACCEPT
	"$IPTABLES" --verbose --table mangle --append PREROUTING --in-interface "${BRIDGE_INTERFACE}" --source "${IP_RANGE_AMC}/${NET_MASK_AMC}" --destination "${BRIDGE_IP}" --protocol icmp --jump ACCEPT
	#
	#
	#
#	"$IPTABLES" --verbose --table filter	--append INPUT		--jump LOG
#	"$IPTABLES" --verbose --table filter	--append FORWARD	--jump LOG
#	"$IPTABLES" --verbose --table filter	--append OUTPUT		--jump LOG
#	"$IPTABLES" --verbose --table nat	--append PREROUTING	--jump LOG
#	"$IPTABLES" --verbose --table nat	--append POSTROUTING	--jump LOG
#	"$IPTABLES" --verbose --table nat	--append OUTPUT		--jump LOG
#	"$IPTABLES" --verbose --table mangle	--append PREROUTING	--jump LOG
#	"$IPTABLES" --verbose --table mangle	--append OUTPUT		--jump LOG
	#
	# para o squid (proxy server)
	#
	"$IPTABLES" --verbose --table nat	--append PREROUTING	--in-interface "$LOCAL_INTERFACE"	--protocol tcp --dport "$HTTP_PORT" --jump REDIRECT --to-port "$SQUID_PORT"
	#
	# A ordem de inser������o das regras ��� importante.
	# Este deve ser a primeira regra da tabela nat cadeia POSTROUTING.
	#
	"$IPTABLES" --verbose --table nat --append POSTROUTING --source "$IP_RANGE_GENESYS"/"$NET_MASK_GENESYS" --jump SNAT --to-source "$BRIDGE_IP"
	#
	#
	#
	"$IPTABLES" --verbose --table filter	--append INPUT		--match state --state RELATED,ESTABLISHED --jump ACCEPT
	"$IPTABLES" --verbose --table filter	--append FORWARD	--match state --state RELATED,ESTABLISHED --jump ACCEPT
	"$IPTABLES" --verbose --table filter	--append OUTPUT		--match state --state RELATED,ESTABLISHED --jump ACCEPT
	"$IPTABLES" --verbose --table nat	--append PREROUTING	--match state --state RELATED,ESTABLISHED --jump ACCEPT
	"$IPTABLES" --verbose --table nat	--append POSTROUTING	--match state --state RELATED,ESTABLISHED --jump ACCEPT
	"$IPTABLES" --verbose --table nat	--append OUTPUT		--match state --state RELATED,ESTABLISHED --jump ACCEPT
	"$IPTABLES" --verbose --table mangle	--append PREROUTING	--match state --state RELATED,ESTABLISHED --jump ACCEPT
	"$IPTABLES" --verbose --table mangle	--append OUTPUT		--match state --state RELATED,ESTABLISHED --jump ACCEPT
	#
	#
	#
	"$IPTABLES" --verbose --table nat	--append PREROUTING	--source "$IP_RANGE_GENESYS"/"$NET_MASK_GENESYS" --match state --state NEW --jump ACCEPT
	"$IPTABLES" --verbose --table nat	--append POSTROUTING	--source "$IP_RANGE_GENESYS"/"$NET_MASK_GENESYS" --match state --state NEW --jump ACCEPT
	"$IPTABLES" --verbose --table nat	--append OUTPUT		--source "$IP_RANGE_GENESYS"/"$NET_MASK_GENESYS" --match state --state NEW --jump ACCEPT
	#
	#
	#
	"$IPTABLES" --verbose --table filter	--append INPUT		--source "$IP_RANGE_GENESYS"/"$NET_MASK_GENESYS" --jump ACCEPT
	"$IPTABLES" --verbose --table filter	--append FORWARD	--source "$IP_RANGE_GENESYS"/"$NET_MASK_GENESYS" --jump ACCEPT
	"$IPTABLES" --verbose --table filter	--append OUTPUT		--source "$IP_RANGE_GENESYS"/"$NET_MASK_GENESYS" --jump ACCEPT
	"$IPTABLES" --verbose --table nat	--append PREROUTING	--source "$IP_RANGE_GENESYS"/"$NET_MASK_GENESYS" --jump ACCEPT
	"$IPTABLES" --verbose --table nat	--append POSTROUTING	--source "$IP_RANGE_GENESYS"/"$NET_MASK_GENESYS" --jump ACCEPT
	"$IPTABLES" --verbose --table nat	--append OUTPUT		--source "$IP_RANGE_GENESYS"/"$NET_MASK_GENESYS" --jump ACCEPT
	"$IPTABLES" --verbose --table mangle	--append PREROUTING	--source "$IP_RANGE_GENESYS"/"$NET_MASK_GENESYS" --jump ACCEPT
	"$IPTABLES" --verbose --table mangle	--append OUTPUT		--source "$IP_RANGE_GENESYS"/"$NET_MASK_GENESYS" --jump ACCEPT
	#
	#
	#
	"$IPTABLES" --verbose --table filter	--append INPUT		--source "$BRIDGE_IP" --jump ACCEPT
	"$IPTABLES" --verbose --table filter	--append FORWARD	--source "$BRIDGE_IP" --jump ACCEPT
	"$IPTABLES" --verbose --table filter	--append OUTPUT		--source "$BRIDGE_IP" --jump ACCEPT
	"$IPTABLES" --verbose --table nat	--append PREROUTING	--source "$BRIDGE_IP" --jump ACCEPT
	"$IPTABLES" --verbose --table nat	--append POSTROUTING	--source "$BRIDGE_IP" --jump ACCEPT
	"$IPTABLES" --verbose --table nat	--append OUTPUT		--source "$BRIDGE_IP" --jump ACCEPT
	"$IPTABLES" --verbose --table mangle	--append PREROUTING	--source "$BRIDGE_IP" --jump ACCEPT
	"$IPTABLES" --verbose --table mangle	--append OUTPUT		--source "$BRIDGE_IP" --jump ACCEPT
	#
	#
	#
	"$IPTABLES" --verbose --table filter	--append INPUT		--source "$LOOPBACK_IP" --jump ACCEPT
	"$IPTABLES" --verbose --table filter	--append FORWARD	--source "$LOOPBACK_IP" --jump ACCEPT
	"$IPTABLES" --verbose --table filter	--append OUTPUT		--source "$LOOPBACK_IP" --jump ACCEPT
	"$IPTABLES" --verbose --table nat	--append PREROUTING	--source "$LOOPBACK_IP" --jump ACCEPT
	"$IPTABLES" --verbose --table nat	--append POSTROUTING	--source "$LOOPBACK_IP" --jump ACCEPT
	"$IPTABLES" --verbose --table nat	--append OUTPUT		--source "$LOOPBACK_IP" --jump ACCEPT
	"$IPTABLES" --verbose --table mangle	--append PREROUTING	--source "$LOOPBACK_IP" --jump ACCEPT
	"$IPTABLES" --verbose --table mangle	--append OUTPUT		--source "$LOOPBACK_IP" --jump ACCEPT
	#
	#
	#
	# flach, 23 de Outubro de 2002.
	# Conclus���es dos testes acima:
	# 1) A primeira cadeia acessada quando um pacote ��� recebido ��� a PREROUTING da tabela MANGLE.
	#	A seguinte regra foi acrescentada: "$IPTABLES" --verbose --table mangle	--append PREROUTING	--source "${IP_RANGE_AMC}/${NET_MASK_AMC}"	--destination "${BRIDGE_IP}"			--protocol tcp --dport "$HTTP_PORT" --in-interface "${BRIDGE_INTERFACE}"	--jump ACCEPT
	# 2) A segunda cadeia acessada quando um pacote ��� recebido ��� a PREROUTING da tabela NAT.
	#	A seguinte regra foi acrescentada: "$IPTABLES" --verbose --table nat	--append PREROUTING	--source "${IP_RANGE_AMC}/${NET_MASK_AMC}"	--destination "${BRIDGE_IP}"			--protocol tcp --dport "$HTTP_PORT" --in-interface "${BRIDGE_INTERFACE}"	--jump DNAT --to-destination "${FLACH}:${HTTP_PORT}"
	#	Depois deste acr���scimo a conex���o j��� foi estabalecida, pelo iptraf, entre a m���quina 192.168.2.250 e a m���quina 192.168.2.178
	# 3) A terceira regra acessada quando um pacote ��� recebido (nesta situa������o) ��� a FORWARD da tabela filter.
	#	A seguinte regra foi acrescentada: "$IPTABLES" --verbose --table filter	--append FORWARD	--source "${IP_RANGE_AMC}/${NET_MASK_AMC}"	--destination "${FLACH}"			--protocol tcp --dport "$HTTP_PORT" --in-interface "${BRIDGE_INTERFACE}"	--jump ACCEPT
	# 4) A quarta regra acessada ��� a POSTROUTING da tabela nat.
	#	A seguinte regra foi acrescentada: "$IPTABLES" --verbose --table nat	--append POSTROUTING	--source "${IP_RANGE_AMC}/${NET_MASK_AMC}"	--destination "${FLACH}"			--protocol tcp --dport "$HTTP_PORT" --out-interface "${LOCAL_INTERFACE}"	--jump ACCEPT
	# 5) N���o houver mais nenhuma rejei������o. Mas foi verificado que a conex���o n���o acontece.
	#	A ���ltima regra foi modificada para: "$IPTABLES" --verbose --table nat	--append POSTROUTING	--source "${IP_RANGE_AMC}/${NET_MASK_AMC}"	--destination "${FLACH}"			--protocol tcp --dport "$HTTP_PORT" --out-interface "${LOCAL_INTERFACE}"	--jump SNAT --to-source "${LOCAL_IP}"
	#	e tudo passou a funcionar corretamente.
	#	O alias 192.168.2.250/255.255.255.0 foi exclu���do da m���quina flach.
	#
	"$IPTABLES" --verbose --table mangle	--append PREROUTING	--source "${IP_RANGE_AMC}/${NET_MASK_AMC}"	--destination "${BRIDGE_IP}"			--protocol tcp --dport "$HTTP_PORT" --in-interface "${BRIDGE_INTERFACE}"	--jump ACCEPT
	"$IPTABLES" --verbose --table nat	--append PREROUTING	--source "${IP_RANGE_AMC}/${NET_MASK_AMC}"	--destination "${BRIDGE_IP}"			--protocol tcp --dport "$HTTP_PORT" --in-interface "${BRIDGE_INTERFACE}"	--jump DNAT --to-destination "${FLACH}:${HTTP_PORT}"
	"$IPTABLES" --verbose --table filter	--append FORWARD	--source "${IP_RANGE_AMC}/${NET_MASK_AMC}"	--destination "${FLACH}"			--protocol tcp --dport "$HTTP_PORT" --in-interface "${BRIDGE_INTERFACE}"	--jump ACCEPT
	"$IPTABLES" --verbose --table nat	--append POSTROUTING	--source "${IP_RANGE_AMC}/${NET_MASK_AMC}"	--destination "${FLACH}"			--protocol tcp --dport "$HTTP_PORT" --out-interface "${LOCAL_INTERFACE}"	--jump SNAT --to-source "${LOCAL_IP}"
	#
	# Seguem as linhas de teste que resultaram nas conclus���es acima.
	# 192.168.2.250 ��� um ip de alias para a placa eth0 da m���quina flach
	# A m���quina flach tem dois ips:
	# 192.168.2.178/255.255.255.240
	# 192.168.2.250/255.255.255.0
	#
#	"$IPTABLES" --verbose --table filter --append INPUT --source 192.168.2.250 --jump LOG
#	"$IPTABLES" --verbose --table filter --append INPUT --destination 192.168.2.250 --jump LOG
#	"$IPTABLES" --verbose --table filter --append FORWARD --source 192.168.2.250 --jump LOG
#	"$IPTABLES" --verbose --table filter --append FORWARD --destination 192.168.2.250 --jump LOG
#	"$IPTABLES" --verbose --table filter --append OUTPUT --source 192.168.2.250 --jump LOG
#	"$IPTABLES" --verbose --table filter --append OUTPUT --destination 192.168.2.250 --jump LOG
#	"$IPTABLES" --verbose --table nat --append PREROUTING --source 192.168.2.250 --jump LOG
#	"$IPTABLES" --verbose --table nat --append PREROUTING --destination 192.168.2.250 --jump LOG
#	"$IPTABLES" --verbose --table nat --append POSTROUTING --source 192.168.2.250 --jump LOG
#	"$IPTABLES" --verbose --table nat --append POSTROUTING --destination 192.168.2.250 --jump LOG
#	"$IPTABLES" --verbose --table nat --append OUTPUT --source 192.168.2.250 --jump LOG
#	"$IPTABLES" --verbose --table nat --append OUTPUT --destination 192.168.2.250 --jump LOG
#	"$IPTABLES" --verbose --table mangle --append PREROUTING --source 192.168.2.250 --jump LOG
#	"$IPTABLES" --verbose --table mangle --append PREROUTING --destination 192.168.2.250 --jump LOG
#	"$IPTABLES" --verbose --table mangle --append OUTPUT --source 192.168.2.250 --jump LOG
#	"$IPTABLES" --verbose --table mangle --append OUTPUT --destination 192.168.2.250 --jump LOG
#	"$IPTABLES" --verbose --table filter --append INPUT --source "${FLACH}" --jump LOG
#	"$IPTABLES" --verbose --table filter --append INPUT --destination "${FLACH}" --jump LOG
#	"$IPTABLES" --verbose --table filter --append FORWARD --source "${FLACH}" --jump LOG
#	"$IPTABLES" --verbose --table filter --append FORWARD --destination "${FLACH}" --jump LOG
#	"$IPTABLES" --verbose --table filter --append OUTPUT --source "${FLACH}" --jump LOG
#	"$IPTABLES" --verbose --table filter --append OUTPUT --destination "${FLACH}" --jump LOG
#	"$IPTABLES" --verbose --table nat --append PREROUTING --source "${FLACH}" --jump LOG
#	"$IPTABLES" --verbose --table nat --append PREROUTING --destination "${FLACH}" --jump LOG
#	"$IPTABLES" --verbose --table nat --append POSTROUTING --source "${FLACH}" --jump LOG
#	"$IPTABLES" --verbose --table nat --append POSTROUTING --destination "${FLACH}" --jump LOG
#	"$IPTABLES" --verbose --table nat --append OUTPUT --source "${FLACH}" --jump LOG
#	"$IPTABLES" --verbose --table nat --append OUTPUT --destination "${FLACH}" --jump LOG
#	"$IPTABLES" --verbose --table mangle --append PREROUTING --source "${FLACH}" --jump LOG
#	"$IPTABLES" --verbose --table mangle --append PREROUTING --destination "${FLACH}" --jump LOG
#	"$IPTABLES" --verbose --table mangle --append OUTPUT --source "${FLACH}" --jump LOG
#	"$IPTABLES" --verbose --table mangle --append OUTPUT --destination "${FLACH}" --jump LOG
#	"$IPTABLES" --verbose --table filter --append INPUT --source 192.168.2.250 --jump LOG
#	"$IPTABLES" --verbose --table filter --append INPUT --destination 192.168.2.250 --jump LOG
#	"$IPTABLES" --verbose --table filter --append FORWARD --source 192.168.2.250 --jump LOG
#	"$IPTABLES" --verbose --table filter --append FORWARD --destination 192.168.2.250 --jump LOG
#	"$IPTABLES" --verbose --table filter --append OUTPUT --source 192.168.2.250 --jump LOG
#	"$IPTABLES" --verbose --table filter --append OUTPUT --destination 192.168.2.250 --jump LOG
#	"$IPTABLES" --verbose --table nat --append PREROUTING --source 192.168.2.250 --jump LOG
#	"$IPTABLES" --verbose --table nat --append PREROUTING --destination 192.168.2.250 --jump LOG
#	"$IPTABLES" --verbose --table nat --append POSTROUTING --source 192.168.2.250 --jump LOG
#	"$IPTABLES" --verbose --table nat --append POSTROUTING --destination 192.168.2.250 --jump LOG
#	"$IPTABLES" --verbose --table nat --append OUTPUT --source 192.168.2.250 --jump LOG
#	"$IPTABLES" --verbose --table nat --append OUTPUT --destination 192.168.2.250 --jump LOG
#	"$IPTABLES" --verbose --table mangle --append PREROUTING --source 192.168.2.250 --jump LOG
#	"$IPTABLES" --verbose --table mangle --append PREROUTING --destination 192.168.2.250 --jump LOG
#	"$IPTABLES" --verbose --table mangle --append OUTPUT --source 192.168.2.250 --jump LOG
#	"$IPTABLES" --verbose --table mangle --append OUTPUT --destination 192.168.2.250 --jump LOG
	#
	#
	#
	;;
	stop)
	gprintf "Parando o servi���o de %s: " "IPTables"
	echo
	"$IPTABLES" --verbose --table filter	--delete-chain
	"$IPTABLES" --verbose --table nat	--delete-chain
	"$IPTABLES" --verbose --table mangle	--delete-chain
	#
	#
	#
	"$IPTABLES" --verbose --table filter	--flush
	"$IPTABLES" --verbose --table nat	--flush
	"$IPTABLES" --verbose --table mangle	--flush
	#
	#
	#
	"$IPTABLES" --verbose --table filter	--policy INPUT		ACCEPT
	"$IPTABLES" --verbose --table filter	--policy FORWARD	ACCEPT
	"$IPTABLES" --verbose --table filter	--policy OUTPUT		ACCEPT
	"$IPTABLES" --verbose --table nat	--policy PREROUTING	ACCEPT
	"$IPTABLES" --verbose --table nat	--policy POSTROUTING	ACCEPT
	"$IPTABLES" --verbose --table nat	--policy OUTPUT		ACCEPT
	"$IPTABLES" --verbose --table mangle	--policy PREROUTING	ACCEPT
	"$IPTABLES" --verbose --table mangle	--policy OUTPUT		ACCEPT
	#
	# para o squid (proxy server)
	#
	"$IPTABLES" --verbose --table nat	--append PREROUTING	--in-interface "$LOCAL_INTERFACE"	--protocol tcp --dport "$HTTP_PORT" --jump REDIRECT --to-port "$SQUID_PORT"
	#
	# A ordem de inser������o das regras ��� importante.
	# Este deve ser a primeira regra da tabela nat cadeia POSTROUTING.
	#
	"$IPTABLES" --verbose --table nat	--append PREROUTING	--source "${IP_RANGE_AMC}/${NET_MASK_AMC}" --destination "${BRIDGE_IP}" --protocol tcp --dport "$HTTP_PORT" --in-interface "${BRIDGE_INTERFACE}" --jump DNAT --to-destination "${FLACH}":"${HTTP_PORT}"
	"$IPTABLES" --verbose --table nat	--append POSTROUTING	--source "$IP_RANGE_GENESYS"/"$NET_MASK_GENESYS" --jump SNAT --to-source "$BRIDGE_IP"
	;;
	status)
	gprintf "========================================================================================\n"
	gprintf "\n"
	gprintf "tabela filter:\n"
	gprintf "\n"
	"$IPTABLES" --verbose --table filter --list 
	gprintf "========================================================================================\n"
	gprintf "\n"
	gprintf "tabela nat:\n"
	gprintf "\n"
	"$IPTABLES" --verbose --table nat --list 
	gprintf "========================================================================================\n"
	gprintf "\n"
	gprintf "tabela mangle:\n"
	gprintf "\n"
	"$IPTABLES" --verbose --table mangle --list 
	;;
	restart|reload)
	$0 stop
	$0 start
	;;
	*)
	gprintf "Uso: /etc/rc.d/inti.d/iptables (start|stop|status|restart|reload)"
	echo
	;;
esac

exit 0

--------------060701040305050309080202--


