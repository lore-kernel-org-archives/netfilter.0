From: Stephen Satchell <list@fluent2.pyramid.net>
Subject: Re: Is Linux IPTABLES firewall comparable with license Firewall
Date: Sun, 19 Oct 2003 08:13:54 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.1.1.0.20031019080722.010b4150@fluent2.pyramid.net>
References: <20031018091807.26000.qmail@web20711.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031018091807.26000.qmail@web20711.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: ads nat <adsnat@yahoo.com>, netfilter@lists.netfilter.org

At 02:18 AM 10/18/2003 -0700, ads nat wrote:
>My competitors use Checkpoint Firewall.
>Can somebody guide me how to convince my users that
>Linux IPTABLES Firewall is technically at par with
>commercial Firewall such as checkpoint.
>
>Also if same security policies are adopted for
>IPTABLES and checkpoint, Is IPTABLES technically at
>par with commercial FIREWALLs?

I run sites with Linux firewalls, and I run sites using SonicWall SOHO 
10s.  During a client demo a year ago, I mentioned I did both, that each 
has their strengths and weaknesses, and at one site I did both in 
tandem.    I use a standard set of rules in both sets of products, with 
customization where needed to fit particular client needs.

One customer wanted to know "what's the difference" between the commercial 
firewall appliance and the one I build using Linux.  So out came my copy of 
nmap, and I showed how both types of systems prevented break-in 
attempts.  The results were a little difference with each product, of 
course, but the customer was convinced that "goodness" wasn't a selection 
criterion.  Instead, he focused his attention where it was really needed, 
the workload and bandwidth the firewall had to handle.

(N.B.:  How that one worked out:  space was also a consideration, and the 
customer felt that the SOHO 50, the bigger brother to the SOHO 10, would 
fit physically better for his needs.  I don't like notebook cases at all, 
even when I'm running Pentium 166 chips, so I didn't argue.  If he had had 
the room for a 1U box, the Linux solution would have won, and may still win 
yet if he doesn't stop growing soon.)




-- 
If the automobile had followed the same development as the computer, a 
Rolls-Royce would today cost $100, get a million miles per gallon, and 
explode once a year killing everyone inside.  --Robert Cringely  


