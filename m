From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: How will I mesure my bandwith
Date: Tue, 5 Nov 2002 13:50:11 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211051350.gA5DoHe19092@vulcan.rissington.net>
References: <Pine.GSO.4.40.0211041029270.5446-100000@amazonas.robotic.dlr.de> <004501c284d1$0336ceb0$8c01a8c0@sundaram>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004501c284d1$0336ceb0$8c01a8c0@sundaram>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tuesday 05 November 2002 1:41 pm, Sundaram Ramasamy wrote:

> Hi,
>
> We have 512kbps connection to our office, How will I measure my bandwidth.

You could use a tool such as iptraf http://cebu.mozcom.com/riker/iptraf or 
simply check the byte counts for your external interface at regular intervals.

ifconfig eth0 | grep bytes
will tell you the number of bytes in & out of eth0 - you could set a cron job 
to do this every minute and redirect the results to a file ?

Antony.

-- 

There are only 10 types of people in the world:
those who understand binary notation,
and those who don't.

