From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: iptables matching method
Date: Mon, 6 Feb 2006 13:05:22 -0600
Message-ID: <200602061305.22977.rob0@gmx.co.uk>
References: <3115d56e0602060218s2ad8ed82ie5ffc03c5d6931bb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3115d56e0602060218s2ad8ed82ie5ffc03c5d6931bb@mail.gmail.com>
Content-Disposition: inline
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

I remember you, and normally would not answer, but this is a good 
question which deserves an answer even if you don't. :)

On Monday 2006-February-06 04:18, afshin lamei wrote:
> I have a question about the way netfilter matches the fields in a
> rule. for example in :
> iptables -A FORWARD -p tcp -m condition --condition myweb -m string
> --string 'test' -j DROP
> there are 3 fields: protocol:tcp, condition:myweb and string: 'test'
> . if these 3 fields are matched serially ( one bye one ), then we
> will not pay the cost of string matching for none-tcp packets, also
> if the "myweb" condition is off again we have not to concern the
> string matching overhead.
> But if they are matched in parallel, then we will pay the cost of
> string matching for all packets.
> Does any one no which method (serial or parallel) is really used by

I don't know how it's done in the single rule, but what I would do to 
remove any doubt is to use user chains to do the matching in the order 
you want:

iptables -N StrTest
iptables -A FORWARD -p tcp -m condition --condition myweb -j StrTest
iptables -A StrTest -m string --string 'test' -j DROP

You could get even fancier and branch into separate chains for the -p 
tcp and -m condition matching too. But my example does avoid the string 
matching, which no doubt is the greatest concern.
-- 
    Offlist mail to this address is discarded unless
    "/dev/rob0" or "not-spam" is in Subject: header

