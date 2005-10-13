From: "Eric Leblond" <eric@inl.fr>
Subject: Re: Need a method to reset the ip_conntrack_count
Date: Thu, 13 Oct 2005 11:55:29 +0200 (CEST)
Message-ID: <42210.193.164.229.102.1129197329.squirrel@mail.inl.fr>
References: <002601c5b390$1d641d10$fefefe0a@jesseh7ht76e8n>
	<007d01c5cfd8$fa089840$aa0ba8c0@l7.com.tw>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <007d01c5cfd8$fa089840$aa0ba8c0@l7.com.tw>
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

> Hello folks,
>
> I have encountered one question. Does it have a way to flush the

> My Enviroment:
> Kenel: 2.6.10
> Iptables: 1.2.9

you need to use the upcoming 2.6.14 to be able to do so....
Pablo Neira's conntrack tool can do the job.

>
> Any hint are appreciated.
>
> Vincent
>
>
>
>



