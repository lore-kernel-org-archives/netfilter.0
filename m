From: "Andreas Grabner" <andi@vnc.at>
Subject: RE: 2 ISPs again
Date: Fri, 10 Dec 2004 20:17:28 +0100 (CET)
Message-ID: <40920.83.64.132.50.1102706248.squirrel@webmail.vnc.at>
References: <7C9884991ADAE0479C14F10C858BCDF591E3A3@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF591E3A3@alderaan.smgtec.com>
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
To: dchemko@smgtec.com
Cc: netfilter@lists.netfilter.org

Thanks a lot for your reply!!!

> If your own IP's on the firewall aren't bound to the network, you'll
What does                                 ^^^^^^^^^^^^^^^^^^^^^ this mean?
> have to disable rp_filtering. echo "0" >
> /proc/sys/net/ipv4/eth_whatever/rp_filter
no i will try


> You'll also want to make sure outgoing packets are getting natted
> correctly (if you're natting).
Yes i am natting


Andreas grabner



