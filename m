From: Askar <askarali@gmail.com>
Subject: Re: IPTables & HTTPD Conflict
Date: Mon, 4 Apr 2005 17:32:07 +0600
Message-ID: <a0f69e505040404325bf851f5@mail.gmail.com>
References: <200504031339.j33DdR2X003262@osprey.tkevans.com>
	<249c202905040319115c97c290@mail.gmail.com>
	<a0f69e5050404024079ea9980@mail.gmail.com>
	<249c20290504040259680894c@mail.gmail.com>
Reply-To: Askar <askarali@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <249c20290504040259680894c@mail.gmail.com>
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
To: J A <jake.lists@gmail.com>
Cc: netfilter@lists.netfilter.org

On Apr 4, 2005 3:59 PM, J A <jake.lists@gmail.com> wrote:
> Sorry, when i replied to the thread, i seemed to have copied only
> guido, here's a re-send:
> 
> Here are our rules (pls refer to the thread for the problem
> description), hope you could share us your vasluable insight.
> --------------------------------------------------------------------------
> *filter
> :INPUT ACCEPT [0:0]
> :FORWARD ACCEPT [0:0]
> :OUTPUT ACCEPT [0:0]
> :RH-Lokkit-0-50-INPUT - [0:0]
> -A INPUT -j RH-Lokkit-0-50-INPUT
> -A FORWARD -j RH-Lokkit-0-50-INPUT
> -A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 25 --syn -j ACCEPT
> -A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 80 --syn -j ACCEPT
> -A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 21 --syn -j ACCEPT
> -A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 22 --syn -j ACCEPT
> -A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 23 --syn -j ACCEPT
> -A RH-Lokkit-0-50-INPUT -i lo -j ACCEPT
> -A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 0:1023 --syn -j REJECT
> -A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 2049 --syn -j REJECT
> -A RH-Lokkit-0-50-INPUT -p udp -m udp --dport 0:1023 -j REJECT
> -A RH-Lokkit-0-50-INPUT -p udp -m udp --dport 2049 -j REJECT
> -A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 6000:6009 --syn -j REJECT
> -A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 7100 --syn -j REJECT
> COMMIT
> --------------------------------------------------------------------------
> 
> 
> On Apr 4, 2005 5:40 PM, Askar <askarali@gmail.com> wrote:
> > how should we suggest something without watchen your iptables rules set?
> >
> > regards
> >
> >
> > On Apr 4, 2005 8:11 AM, J A <jake.lists@gmail.com> wrote:
> > > Hello All,
> > >
> > > We're using Redhat 9
> > > We've been running a Web Server (Apache & Tomcat), and were told to
> > > run a firewall, in this case IPTables.  When we enabled IPTables, many
> > > of our web sites (BUT not all) could no longer be browsed from the
> > > Internet.
> > >
> > > Could you tell us which specific IPTables parameter is doing this, so
> > > we could disable only the specific parameter?
> > > Or is it not advisable to run IPTables side-by-side with Web services?
> > >
> > > Thanks, appreciate your ideas.
> > >
> > > ---jake
> > >
> > >
> >
> > --
> > I love deadlines. I like the whooshing sound they make as they fly by.
> > Douglas Adams
> >
> 
okay try these iptables rules as starting point, 

# Load the FTP connection state helper module.
#Clear \ Flush all the rules from the different chains and tables
for table in mangle nat filter; do
   iptables -t $table -F
   iptables -t $table -X
done
# Set the default filter table policy
iptables --policy INPUT   DROP
iptables --policy OUTPUT  ACCEPT
iptables --policy FORWARD DROP

# Using Connection State to By-pass Rule Checking
iptables -A INPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp -m multiport --dport 25,80,21,22,23 -m state
--state NEW -j ACCEPT

Note: save these rules to a file, then chmod +x the file and then
execute it with ./filename :)

regards


-- 
I love deadlines. I like the whooshing sound they make as they fly by.
Douglas Adams

