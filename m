From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Port Scanning: Is there a difference between stateful INVALID
 	filtering and stateless TCP flag filtering?
Date: Wed, 24 Feb 2010 12:20:40 +0100
Message-ID: <4B850B88.1070702@chello.at>
References: <ac5c74141002240018pd69e696vce194ed87e90b643@mail.gmail.com> <4B8509B6.7000408@chello.at>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B8509B6.7000408@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 24.02.2010 12:14, netfilter-owner@vger.kernel.org wrote:
> On 24.02.2010 09:18, netfilter-owner@vger.kernel.org wrote:
>> Hello everyone,
>>

> 
> iptables -I INPUT -m state --state INVALID -j LOG
> iptables -I INPUT -m state --state INVALID -j DROP
just the other way round...

> 
