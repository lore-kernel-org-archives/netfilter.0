From: skydive <skydive@megamail.pt>
Subject: (no subject)
Date: Fri, 21 Nov 2003 11:16:03 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1069413363.3fbdf3f35886d@paris-hme1>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

hi all again

my first question related wiht "http access - fixing=20
DNAT port forwarding access from internal networks"=20
was answered successfully, since it is working fine,=20
thanks to all that could help ;)

now i happen to have a proxy server running on the=20
same machine as the web server, and i would like to=20
block incoming traffic to my web server from addresses
wich are not portuguese. i already got a list of the=20
ip ranges and net masks of all autonomous systems=20
located in portugal. i first tried to accept all those=20
ip ranges, and then droped all other incoming. what=20
happens is that proxy will accept connections only=20
=66rom those ip ranges i accepted initialy ( the=20
postuguese ones). Let=B4s say i'm trying to connect to=20
hotmail.com. i won't work since that ip range is not=20
being accepted.

is there a way to accept connections related with=20
previous conections made to this machine to por 3128=20
(squid default port)?

i want to accept conections that even if they do not=20
match with ipranges i'm accepting, they're related=20
with a previous connection made to the proxy server,=20
related with proxy port whatever it'll be ;))


i'm aware this can not be this easy... but still=20
believe there is a way out :))


[][]

thank you all
skydive!

-------------------------------------------------
Email Enviado utilizando o servi=E7o MegaMail


