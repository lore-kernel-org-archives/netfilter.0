From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: redirect rule question
Date: Tue, 05 Feb 2008 14:06:17 -0600
Message-ID: <47A8C1B9.2070006@riverviewtech.net>
References: <df1bdeb10802051119w6b92ac21iae36c7d66cb94de8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <df1bdeb10802051119w6b92ac21iae36c7d66cb94de8@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 02/05/08 13:19, Srinivas Murthy wrote:
> If there is a mark set on an skb, (for any src or dst ip or port 
> no's), redirect to the port no equal to the mark.

I'm not aware of any thing in IPTables that will act like a variable 
that can be set to the value of the mark and then later use the contents 
of the variable as the source for a redirect.

I'm afraid that you will need a multiple rules to match the multiple marks.



Grant. . . .
