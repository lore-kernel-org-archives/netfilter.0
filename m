From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: string
Date: Fri, 17 Oct 2008 12:22:12 -0500
Message-ID: <48F8C9C4.9010008@riverviewtech.net>
References: <38e492ee0810170730t1a330ec2td54f190dd5f66aed@mail.gmail.com> <20081017150835.GB21398@khasse.inl.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20081017150835.GB21398@khasse.inl.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/17/08 10:08, Eric Leblond wrote:
> NAT table is only reached for the SYN packet. Thus you can match of 
> the GET which come later.

*nod*

> You should use a proxy to do so.

Agreed.

-or-

You could also set up your own DNS server and use it to poison DNS for 
Yahoo.  Resolve any Yahoo domains to your own server that is set up to 
reply to any and all web pages.  Then configure that web server / page 
to issue a 302 redirect to the web page that you want people to see.



Grant. . . .
