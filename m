From: Tolga Onbay <tolgaonbay@yahoo.com>
Subject: Filtering a web site returned from a Proxy
Date: Tue, 19 Dec 2006 06:53:52 -0800 (PST)
Message-ID: <20061219145352.40461.qmail@web56607.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

=0A=0AHi,=0A=0A=0A =0A=0A=0AI have=0Ainstalled a firewall running on linux =
on summer. In the server firewall,=0Acontent filtering and proxy are runnin=
g. P2P and IM programs are also blocked=0Awith l7 filter. And there is a ru=
le that sends all http connections to content=0Afiltering software. I think=
 this is transparent proxy. :) The rule is as below=0A=0A=0A-A=0APREROUTING=
 -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 8080=0A=0A=0A =0A=0A=0AAny=
way, but=0Athe users found another gap on the system, now they can connect =
any web site=0Awith free or university proxies. Firstly I found a solution =
which if I send connections=0Aon port of Proxy to content filtering softwar=
e, the content filtering software=0Acan handle this. But there is 65534 por=
ts to forward. :)=0A=0A=0A =0A=0A=0AThen,=0Al7-filter save me one more time=
. Now I send the connections having destination=0Aport other than 80 and pr=
otocol http to content filtering software. It is ok until=0Anow. But the co=
nnections are directly being made with the firewall. (Not connecting to des=
ired proxy). The users on the network want to connect to proxy because they=
 want to research=0Aon libraries that can be only accessible via university=
 proxy. =0A=0A=0A =0A=0A=0AI mean I=0Ahave to send the proxy connections to=
 proxy and the returned data must be filtered=0Avia content filtering softw=
are. The diagram of this situation is=0A=0A=0A =0A=0A=0AHost -->=0AFirewall=
 -->  Content Filtering Software --> Proxy --> Proxy of University --> Http=
 Server --> Proxy of=0AUniversity --> Proxy --> Content Filtering Software =
--> Firewall --> Host=0A=0A=0A=0ABut the system are running as follows (Def=
ining proxy on browser doesn't matter)=0A=0A =0AHost -->=0AFirewall -->  Co=
ntent Filtering Software --> Proxy --> Http Server --> Proxy --> Content Fi=
ltering Software --> Firewall --> Host=0A=0A=0A=0A=0A=0A=0A=0AThanks for=0A=
your help=0A=0A=0A =0A=0A=0A =0A=0A=0A=0A=0A=0A____________________________=
______________________=0ADo You Yahoo!?=0ATired of spam?  Yahoo! Mail has t=
he best spam protection around =0Ahttp://mail.yahoo.com 

