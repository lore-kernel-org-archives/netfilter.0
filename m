From: "Jiann-Ming Su" <sujiannming@gmail.com>
Subject: Re: use of -m limit for Syn Flood protection
Date: Sat, 14 Oct 2006 16:03:10 -0400
Message-ID: <561dc3260610141303u1d41bd43t2f8d59c1afa93d5f@mail.gmail.com>
References: <4530E332.4090306@eccotours.co.za>
	<561dc3260610140717i45c75303weaa16bf327bd1f6d@mail.gmail.com>
	<45311435.20604@eccotours.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45311435.20604@eccotours.co.za>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

On 10/14/06, Brent Clark <bclark@eccotours.co.za> wrote:
>
> Thank you for your reply.
>
> May I ask what you would consider a more realistic limit /value.
>
> I currently have ports 25, 80 and 443 open. I would like to strive to get a respectable value that would cater for these ports.
>
>

Here's what we've used for the wild, wild west that is a residential
hall network for a university:

-A FORWARD -i eth2 -p tcp -m tcp --tcp-flags SYN SYN -j FWD_SYN
-A FWD_SYN -p tcp -m tcp --tcp-flags FIN FIN -m limit --limit 10/min
-j ULOG --ulog-prefix "iptables S
YN/FIN attack"
-A FWD_SYN -p tcp -m tcp --tcp-flags FIN FIN -j DROP
-A FWD_SYN -p tcp -m tcp --dport 80 -m limit --limit 200/sec
--limit-burst 400 -j ACCEPT
-A FWD_SYN -p tcp -m tcp --dport 135 -m limit --limit 50/sec
--limit-burst 50 -j ACCEPT
-A FWD_SYN -p tcp -m tcp --dport 139 -m limit --limit 50/sec
--limit-burst 50 -j ACCEPT
-A FWD_SYN -p tcp -m tcp --dport 443 -m limit --limit 50/sec
--limit-burst 50 -j ACCEPT
-A FWD_SYN -p tcp -m tcp --dport 445 -m limit --limit 50/sec
--limit-burst 50 -j ACCEPT
-A FWD_SYN -p tcp -m tcp --dport 80 -m limit --limit 1/sec -j ULOG
--ulog-prefix "iptables syn limit (http): "
-A FWD_SYN -p tcp -m multiport --dports 135,139,443,445 -m limit
--limit 10/min -j ULOG --ulog-prefix "iptables syn limit (MS): "
-A FWD_SYN -p tcp -m tcp -m multiport --dports 80,135,139,443,445 -j DROP
-A FWD_SYN -p tcp -m tcp -m limit --limit 100/sec --limit-burst 200 -j ACCEPT
-A FWD_SYN -p tcp -m tcp -m limit --limit 10/min -j ULOG --ulog-prefix
"iptables syn limit: "
-A FWD_SYN -j DROP


-- 
Jiann-Ming Su
"I have to decide between two equally frightening options.
 If I wanted to do that, I'd vote." --Duckman
"The system's broke, Hank.  The election baby has peed in
the bath water.  You got to throw 'em both out."  --Dale Gribble

