From: Brent Clark <bclark@eccotours.co.za>
Subject: Re: 8080 to 22
Date: Mon, 20 Feb 2006 13:39:03 +0200
Message-ID: <43F9AA57.1030109@eccotours.co.za>
References: <43F9A730.1040907@eccotours.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43F9A730.1040907@eccotours.co.za>
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

Brent Clark wrote:
> Hi all
> 
> I am in need of connecting to a machine with SSH, but via port 8080.
> 
> I tried the following
> 
> $IPT -t nat -A PREROUTING -i eth0 -p tcp --dport 8080 -j DNAT --to 
> 10.0.0.10:22
> $IPT -t filter -A FORWARD -i eth0 -p tcp --dport 8080 -d 10.0.0.10 -j 
> ACCEPT

Sorry Never Mind

Would help if I allow 8080 on my own personal fw.

Thanks anyway.

Kind Regards
Brent Clark

