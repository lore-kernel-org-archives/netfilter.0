From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NAT with log
Date: Thu, 5 Sep 2002 14:21:08 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209051321.g85DLCv00554@vulcan.rissington.net>
References: <5.1.0.14.2.20020905100458.00ad6de0@mail.pop-pa.rnp.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.1.0.14.2.20020905100458.00ad6de0@mail.pop-pa.rnp.br>
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

On Thursday 05 September 2002 2:10 pm, Fabio Yu Nagahama wrote:

> I have an internal network with invalid IPs and 6 ranges of C class IPs
> availabe. I can make the NAT with no problem, but I need to make a log of
> witch internal IP got out with witch valid IP. Does anybody know how to do
> that?

If you use the NETMAP target to map your invalid IPs to valid IPs then you 
will have a one-to-one correspondence between the two ranges (eg 192.168.1.38 
would go out as xx.yy.zz.38 where xx.yy.zz.0 is your valid IP range).

If you do not use the NETMAP target to map your addresses, then presumably 
you are using SNAT or MASQUERADE, in which case all your internal machines 
are using the same valid IP to reach the Internet, therefore you know the IP 
and you don't need to log anything.

Anton.

-- 

You can spend the whole of your life trying to be popular,
but at the end of the day the size of the crowd at your funeral
will be largely dictated by the weather.

 - Frank Skinner

