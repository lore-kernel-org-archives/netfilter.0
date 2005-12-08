From: Brent Clark <bclark@eccotours.dyndns.org>
Subject: Re: connect to different port
Date: Thu, 08 Dec 2005 16:48:07 +0200
Message-ID: <439847A7.5060800@eccotours.dyndns.org>
References: <4FE82EE778704E4D9D31E9CE0BEC14650D2DAB@caf02.caf.local>
Reply-To: bclark@eccotours.dyndns.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4FE82EE778704E4D9D31E9CE0BEC14650D2DAB@caf02.caf.local>
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
To: Eray Aslan <eray.aslan@caf.com.tr>
Cc: Netfilter <netfilter@lists.netfilter.org>

Eray Aslan wrote:
> netfilter-bounces@lists.netfilter.org <> wrote:
> 
> Try
> 
> $IPT -t nat -A PREROUTING -i eth0 -p tcp --dport 8080 -j DNAT --to 192.168.111.248:3389 
> $IPT -t filter -A FORWARD -i eth0 -p tcp --dport 3389 -d 192.168.111.248 -j ACCEPT 
> 

Hi Eray

Thanks for this, I cant believe I didnt pick this up.

Thanks again.

Brent Clark

