From: Akolinare <akolinare@gmx.net>
Subject: Re: blocking same src/dst traffic (land attacks?)
Date: Fri, 1 Apr 2005 08:36:31 +0200
Message-ID: <20050401083631.12f83349.akolinare@gmx.net>
References: <3BEC0FC090F538409A0736B2D37DA0ED0246F62D@icptex02.corp.icpt.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3BEC0FC090F538409A0736B2D37DA0ED0246F62D@icptex02.corp.icpt.net>
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
To: netfilter@lists.netfilter.org

> What type of rule could you write to block same src/dst traffic. This is
> inregards to blocking land attacks coming in from the outside interface.

I have rules blocking incoming traffic with source ip-addresses from my own network. If you don't have a transit gateway this should be a simple solution to avoid land attacks.

