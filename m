From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Filtering bad http requests
Date: Thu, 17 Jan 2008 20:44:58 -0600
Message-ID: <479012AA.5000905@riverviewtech.net>
References: <478FDA5E.6050908@alumni.uwaterloo.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <478FDA5E.6050908@alumni.uwaterloo.ca>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 1/17/2008 4:44 PM, Mike Leahy wrote:
> I'm wondering if anyone knows of a simple way to filter out bad HTTP
> requests being sent to my server.  You'll find an example of my apache
> log below.  What I would like to do is set this up so that if somebody
> makes too many 404/403 requests within a short period of time (say 5
> hits within 5 minutes), then the IP gets temporarily banned.  I've
> iptables setup to do this sort of thing with brute force ssh login
> attempts.  Below is a simple example of how I have accomplished this (I
> adopted this method from sample I found posted online somewhere).  I'm
> wondering how difficult it might be to do the same (i.e., identify
> connections that get 404/403 responses from httpd, and temporarily ban
> their IP).

Consider using the layer 7 filter to look for the 4xx error codes in 
conjunction with the recent match extension to realize which system(s) 
are causing ""problems.  Use the recent match extension to start 
rejecting new connections from the ""problem system(s).



Grant. . . .
