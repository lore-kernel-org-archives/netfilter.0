From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: redirect to webpage
Date: Wed, 31 Oct 2007 11:37:52 -0500
Message-ID: <4728AF60.4090102@riverviewtech.net>
References: <20071031111119.hc54s7z4e80sc0ws@webmail.harrisonburg.k12.va.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20071031111119.hc54s7z4e80sc0ws@webmail.harrisonburg.k12.va.us>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/31/07 10:11, dhottinger@harrisonburg.k12.va.us wrote:
> Not sure if this is the best practice, but it works fine.  What I would 
> like to do, instead of dropping this traffic is have it sent to an 
> internal webserver that has our acceptable use policy on it.  Is there a 
> REDIRECT command, or what would be the best way to accomplish this.  
> Most of this traffic is actually on port 443, and I cant funnel this 
> through my transparent proxy (squid).

Yes.  You want to look in to DNATing the traffic to an internal web 
server that is specifically set up to do what you are wanting to do.

Hint, set up the web server of your choice that will answer any and all 
domain names with one single page, the 404 (not found) error page that 
is the content that you want displayed.  That way no matter what is 
requested, your page will be displayed.  I would also suggest that you 
include the headers to control how long the page is cached for, say 5 - 
15 minutes.  You may or may not want to return a 200 reply code.  Some 
browsers will display ""Friendly 404 pages and thus not display your text.



Grant. . . .
