From: Ernesto Silva <silva@ort.edu.uy>
Subject: common FTP+NAT problem
Date: Mon, 31 Jul 2006 13:35:06 -0300
Message-ID: <44CE313A.4040204@ort.edu.uy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,
    I'm having a problem to access internet ftp servers from my internal network. I understand the ftp connection but I 
don't have enough information about ip_conntrack_ftp and ip_nat_ftp modules, so here is my situation.

I'm using iptables 1.3.3-3, I have the mentioned modules loaded and wrote the following rules:

_fwd="iptables -A FORWARD"
_nat="iptables -A POSTROUTING"

$_fwd -i $INT_IF -p tcp -s $INT_NET --sport 1024: -o $INET_IF --dport 21 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
$_fwd -i $INET_IF -p tcp --sport 21 -o $INT_IF -d $INT_NET --dport 1024: -m state --state     ESTABLISHED,RELATED -j ACCEPT
$_nat -p tcp -s $INT_NET --sport 1024: -o $INET_IF --dport 21 -m state --state NEW,ESTABLISHED,RELATED -j SNAT --to $INET_NIC


Are those rules enough? or do I need to set some rules for port 20 in both active and passive mode?

What is the ip_conntrack_ftp and ip_nat_ftp modules functionality?

Best regards,
--
Ing. Ernesto Silva.
Coordinador de Desarrollo Web y Sistemas Abiertos
Universidad ORT Uruguay.
E-mail: silva@ort.edu.uy
Tel: (+598-2) 902-1505 ext. 206

