From: Fabio Muzzi <liste@kurgan.org>
Subject: Re: SNAT seems to "miss" some packets
Date: Mon, 29 Jan 2007 15:29:28 +0100
Message-ID: <367643499.20070129152928@kurgan.org>
References: <1003211157.20070129141238@kurgan.org>
	<45BDFFBA.9090706@plouf.fr.eu.org>
Reply-To: Fabio Muzzi <liste@kurgan.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45BDFFBA.9090706@plouf.fr.eu.org>
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
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@lists.netfilter.org

Hello Pascal,

Monday, January 29, 2007, 3:07:54 PM, you wrote:


PH> This may be related to the thread "Dropped fin acks (iptables + lvs)"
PH> above, as in both cases most affected packets seem to be FIN/ACK and 
PH> RST/ACK.

I have not read the archives, I'll download and read them soon.

Anyway,  it seems that you are right, it misses only FIN packets... but it
probably  misses  them  in PREROUTING, as I have stated in another post in
this thread.


-- 

  Fabio "Kurgan" Muzzi


