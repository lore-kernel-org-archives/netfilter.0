From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: [Fwd: Server machines behind Firewall]
Date: Fri, 7 Jan 2005 16:09:50 -0500 (EST)
Message-ID: <Pine.LNX.4.05.10501071608200.16399-100000@darkstar.sysinfo.com>
References: <41DEAE9C.62B38374@ita.org.mo>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41DEAE9C.62B38374@ita.org.mo>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: edwardspl@ita.org.mo
Cc: netfilter@lists.netfilter.org

On Fri, 7 Jan 2005 edwardspl@ita.org.mo wrote:

> Jason Opperisano wrote:
> 
> > > Sorry, what useful about the following function ( command line ) ?
> > >
> > > > iptables -A FORWARD -i $EXT_IF -o $INT_IF -p tcp --syn -d $SRV1 \
> > > > ? --dport 80 -j ACCEPT
> >
> > um--it allows the packet through the FORWARD chain of the filter table.
> > remember--you're trying to build a firewall here.
> 
> So, must I enable this kind of function for using the Firewall ?
> 
> 
> 

unless the firewall(ed) system is a stand alone <no other ststems on the
network> then yes, if you wish to forward or pass traffic to the internet
and the other systems.  A stand alone box with a firewall can get by with
just input and output rules.

Thanks,

Ron DuFresne
-- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        admin & senior security consultant:  sysinfo.com
                        http://sysinfo.com

...Love is the ultimate outlaw.  It just won't adhere to rules.
The most any of us can do is sign on as it's accomplice.  Instead
of vowing to honor and obey, maybe we should swear to aid and abet.
That would mean that security is out of the question.  The words
"make" and "stay" become inappropriate.  My love for you has no
strings attached.  I love you for free...
                        -Tom Robins <Still Life With Woodpecker>


