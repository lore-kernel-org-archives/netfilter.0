From: Hudson Delbert J Contr 61 CS/SCBN <Delbert.Hudson@LOSANGELES.AF.MIL>
Subject: RE: tcpdump and Iptables
Date: Fri, 3 Sep 2004 07:23:01 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <7EACCDBB65D37443912D80713CC1245D02382AE8@fsnsab20.losangeles.af.mil>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Netfilter Mailing List' <netfilter@lists.netfilter.org>

netcat (nc shows up under ps) might be usefull...

itsa net utility which does I-O across connex using tcp/ip.

it can make its paths or driven by other programs like ssh.

its got a lot of debug and discovery modules in it so it can (and has)
create
almost any kind of connection..........and some other `interesting
built-ins`.

does:

any tcp or udp 
any direction
any tcp port
any udp port

sound godd...wait ther's more..

tunnel with any/all params on/off.
excellent at port-scanning YOUR own networks
clock controlled buffered send-mode like 1 every X seconds
hexdump
std<err,out> available which means this stuff can be send to tthe syslogs if
desired.


and as usual mileage will vary.....make sure you have permission to do this
if you aint sure ask again...

nufsaid.

v/r,
~piranha


-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of Nick Drage
Sent: Friday, September 03, 2004 3:23 AM
To: netfilter@lists.netfilter.org
Subject: Re: tcpdump and Iptables


On Fri, Sep 03, 2004 at 08:41:42AM +0800, cc wrote:
> Nick Drage wrote:

> >>If I have iptables running and I do a tcpdump -i eth0,   at what
> >>point is tcpdump listening to the connection?
> >
> >tcpdump will see the packets before IPTables does anything to them.
> 
> Thanks NIck for the info.  Exactly what I wanted to know.

Thanks... though Jason's explanation was rather better :)

tcpdump is an excellent tool, but ( excuse me if I'm stating the obvious
), don't underestimate the usefulness of the logging rules in IPTables
combined with 

tail -f /var/log/$logfile | grep $string_you_are_looking_for

-- 
mors omnia vincit

