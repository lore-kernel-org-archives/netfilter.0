From: Rhaoni Chiu Pereira <rhaoni@sistemica.info>
Subject: RE: Multi Addressing... is it possible ?
Date: Fri, 30 Apr 2004 16:58:52 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1083355131.4092affc02756@sistemica.info>
References: <0776B9DA384FFB4C94A6B73F7DC87A6003F35C83@newman.p21.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <0776B9DA384FFB4C94A6B73F7DC87A6003F35C83@newman.p21.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Aldo Lagana <ALagana@p21.com>
Cc: netfilter@lists.netfilter.org

Hi List,

     Aldo, thanks for the tip... I didn't know about the -I parameter... I =
still
have a doubt about a protocol type, I received a documentation of some rules
that I have to create in my firewall and it has a ESP(50) Protocol and no p=
ort
listed so I don't know how to make it using iptables! Does anyone know  wha=
t is
this ESP(50) Protocol ?

Atenciosamente,

Rhaoni Chiu Pereira
Sist=EAmica Computadores

Visite-nos na Web: http://sistemica.info
Fone/Fax : +55 51 3328 1122



Citando Aldo Lagana <ALagana@p21.com>:

<> I dont understand your question but I assume that for those 2 IPs you DO=
N'T
<> want squid to proxy - rules like this work for me:
<>
<> iptables -t nat -I PREROUTING -d 129.37.0.111 --dport 80 -j ACCEPT
<> iptables -t nat -I PREROUTING -d 32.97.118.242 --dport 80 -j ACCEPT
<>
<> -I inserts the rule at the top of the chain thus firing it when it hits
<> those IPs...not the best method, but a quick kludge that works for me.
<>
<> -----Original Message-----
<> From: Rhaoni Chiu Pereira [mailto:rhaoni@sistemica.info]
<> Sent: Friday, April 30, 2004 2:45 PM
<> To: netfilter@lists.netfilter.org
<> Subject: Multi Addressing... is it possible ?
<>
<>
<> Hi List,
<>
<>     I must implement a few firewallrules but I'm a little bit lost. I us=
e a
<> transparent proxy with this following rule:
<>
<>     IPTABLES -t nat -A PREROUTING -p tcp -i eth1 -s 192.168.0.0/16 -d !
<> 192.168.0.0/16 --dport 80 -j REDIRECT --to-port 3128
<>
<>      The -d parameter is because I have a few VPN's and my squid uses a
<> tcp_outgoing_address, so ... Now I must create some exceptions for two I=
P's
<> more
<> than the 192.168.0.0/16 net but I don't know how ... any ideas ?
<>
<>      the Ip's are 129.37.0.113 and 32.97.118.242
<>
<> thanks,
<>
<> Rhaoni Chiu Pereira
<>
<>
<>
<> Visit our website at http://www.p21.com/visit
<> The information in this e-mail is confidential and may contain legally
<> privileged information.  It is intended solely for the person or entity =
to
<> which it is addressed.  Access to this e-mail by anyone else is
<> unauthorized. If you are not the intended recipient, any disclosure,
<> copying, distribution, action taken, or action omitted to be taken in
<> reliance on it, is prohibited and may be unlawful.  If you received this
<> e-mail in error, please contact the sender and delete the material from =
any
<> computer.
<>
<>
<>


