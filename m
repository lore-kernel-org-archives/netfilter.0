From: Alex Satrapa <alex@lintelsys.com.au>
Subject: Re: Performance Monitoring
Date: Tue, 06 Jan 2004 15:04:23 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FFA33C7.9010806@lintelsys.com.au>
References: <004401c3d17c$4baa7cc0$0a01000a@xcom1> <3FF9E4B7.8010109@lintelsys.com.au> <011001c3d3f8$6a6a7e20$7700000a@lawrencewin2k>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <011001c3d3f8$6a6a7e20$7700000a@lawrencewin2k>
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
To: netfilter@lists.netfilter.org

Lawrence Tang wrote:
> Does this will help to calculate each PC on LAN MB usage report ??

You should be able to configure it to do so. IPAC-NG uses separate 
accounting rules for every item that you want to report on. Thus if you 
want individual accounting per PC, you can set it up to do so.

Install it and fiddle. That's my recommendation.

Alex Satrapa




