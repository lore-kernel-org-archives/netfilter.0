From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: ipt_string
Date: Mon, 20 Sep 2004 21:04:43 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040920190444.0DB7E87F@sterenborg.info>
References: <20040920184604.44308.qmail@web90004.mail.scd.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040920184604.44308.qmail@web90004.mail.scd.yahoo.com>
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
To: netfilter@lists.netfilter.org

netfilter-bounces@lists.netfilter.org wrote:
> Hi !
> 
> I am new to linux and networking. However I have set up a
> router on a redhat 9 machine and am using htb.init + squid
> delay pools for bandwidth limiting. But I would like to do
> away with squid since I am just using it for the delay pools
> feature in order to limit downloading based on kewords such
> as .exe .mp3 .mpeg ..etc. The other day I came to know about
> the ipt_string module through google search and am wondering
> if thats what I am looking for. I am looking for something
> with which i can mark packets based on keywords and then
> limit the bandwidth for such packets with htb. Is the
> ipt_string module suitable for this ? If not, then please suggest an
> alternative. 

In this case ipt_string is not what you want : you can only match a
string within a packet. If a string exceeds the packetsize (which will
likely be the case), it won't work.
The best thing I can think of is what you are already doing : use Squid,
but someone else may have other options.


Gr,
Rob


