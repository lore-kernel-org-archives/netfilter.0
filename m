From: "ABOKHALAF, Nassri Abdellatif" <naabokhalaf@refertelecom.pt>
Subject: Port Redirection
Date: Wed, 30 Apr 2003 15:38:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FC1D719A2007441B0C789618028EBC83691@rtsvr8.refertelecom.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello to all,

I need to redirect some services to my ssh port.
my firewall has two interfaces and i want to redirect all traffic to =
port 22,
so i added this code to my firewall script

....initialisation code....

My_PORTS_TCP=3D"22 ftp telnet squid socks kazaa back_or"

echo -n "TCP port "
for i in $My_PORTS_TCP;
do
        echo -n "$i "
        $IPT -t nat -A PREROUTING -p TCP -d $EXTNET --dport $i -j =
REDIRECT --to-ports  22

        fi
done

but when i do tcpdump to port 22 i see no traffic at all, although i am =
doing ftp to my firewall !?!
questions:
1-Is the rule wrong ?
2-Is the tcpdump leastning in a raw socket before redirection ?
3-How can i confirm that redirection is functioning ?

please comment,


nassri




