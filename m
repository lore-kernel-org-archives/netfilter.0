From: Pascal Vilarem <pvilarem-ml@9online.fr>
Subject: Re: ipt_string and Kernel 2.6 !!URGENT!!
Date: Wed, 12 Jan 2005 17:52:20 +0100
Message-ID: <41E555C4.8000103@9online.fr>
References: <186AC876521E0F46BDE77079A6567FD06F5F6A@la-ncc-ms1nsabb.losangeles.afspc.ds.af.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <186AC876521E0F46BDE77079A6567FD06F5F6A@la-ncc-ms1nsabb.losangeles.afspc.ds.af.mil>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

you can also use rotatelogs (it is provided with many distribs... you=20
just have to add specific configuration) if squid can accept its logfile=20
to be moved or use a wrapper like apache logrotate... for all of these=20
you can specify date-based or filesize-based criteria to trigger the=20
switch towards a new empty file.

grtx

Hudson Delbert J Contr 61 CS/SCBN wrote:

>create a link from the squid logfile that points to
>/dev/null and tee the output to a file on host somewhere
>else on your network. not sure if the data will make it
>but it worth a try to avoid the 5gb barrier so the proxy
>doesnt die. use what cmdlind unix hax you know redirect
>the squid output.
>
>-----Original Message-----
>From: netfilter-bounces@lists.netfilter.org
>[mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of Leonardo
>Rodrigues Magalh=E3es
>Sent: Wednesday, January 12, 2005 8:52 AM
>To: Jason Opperisano; netfilter@lists.netfilter.org
>Subject: Re: ipt_string and Kernel 2.6 !!URGENT!!
>
>
> =20
>
>>any proxy worth a "crap" can do more than the string match, so i fail
>>to see your point.  maybe your proxy is "crap."  maybe the skill set of
>>your proxy administrator is "crap."
>>
>>   =20
>>
>
>    I agree completly with you. But I still use string in some rare=20
>situations. Here's one example.
>
>    A network with +500 machines and squid with authentication enabled, =
so=20
>users must authenticate for browsing the web. Transparent proxy is also=20
>enabled. I know transparent+authentication doesnt work. But I use to per=
mit=20
>antivirus/windowsupdate updates WITHOUT authentication, so machines can =
stay=20
>updated with no problems. http NAT is DISABLED, http can only be accesse=
d=20
>throw squid. This setup can be used for any kind of http filtering, ok ?=
?=20
>Yes, it's OK. It works VERY fine.
>
>    But in a +500 machines network, you'll surely have some=20
>virus/spyware/adware running in some machines. And some virus/spyware/ad=
ware=20
>use to make some http requests for getting data. These softwares usually=
=20
>gets Internet Explorer proxy configuration, but they dont know how to=20
>authenticate, as well they dont use to deal with DENIED/407 (you need to=
=20
>authenticate yourself) squid return codes. Some of these softwares make =
http=20
>requests and in case of getting ANYTHING different than the answer expec=
ted,=20
>the request is done again, with absolutely no delay. I've seen, for exam=
ple,=20
>some virus making +90 requests/second in this environment.
>
>    Well, OK, squid is blocking them. But squid has a 2Gb log file=20
>limitation which, in some cases I experienced, was enough for only 5 hou=
rs=20
>of network traffic loaded with some of these virus/adware/spywares. Afte=
r=20
>2Gb of logs, squid dies and there it goes http browsing.
>
>    In this kind of situation, during some virus/adware/spyware outbreak=
, i=20
>use to use the string module for blocking some requests even BEFORE they=
=20
>reach to squid. So I avoid squid dying because of log getting full.
>
>    I know this is a 'complex' environment as well as a complex example.=
 But=20
>it's, at least i think, a valid example of where the string module is VE=
RY=20
>useful. As recommended, i do NOT use string module in normal situations,=
 but=20
>in some outbreak situations, sometimes i get some string rules running f=
or=20
>fast-blocking it and having time for studying and fixing the problem.
>
>    I also would like to see string module in kernel 2.6 ...... basicall=
y=20
>it's the only netfilter patch that I use that have not being migrated to=
 2.6=20
>yet ...
>
>
>    Sincerily,
>    Leonardo Rodrigues
>
>
>
>
> =20
>


