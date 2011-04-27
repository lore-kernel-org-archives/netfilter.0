From: Vigneswaran R <vignesh@atc.tcs.com>
Subject: Re: Proxy Filter iptable Settings
Date: Wed, 27 Apr 2011 17:47:09 +0530
Message-ID: <4DB80945.8040304@atc.tcs.com>
References: <BANLkTin=W-MWbPfrpqnmWDCMq9fGp5CvwQ@mail.gmail.com>	<1303885014.18916.10.camel@andybev-desktop> <BANLkTikUnSoefT3Xy=O+43zWGEw3tgb7wQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTikUnSoefT3Xy=O+43zWGEw3tgb7wQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 04/27/2011 04:56 PM, Mike Hendrie wrote:
> Thanks for the response. Once I implemented your suggestion, I get the
> following error when trying to access the school's website from WITHIN
> the LAN. Why can it not find the URL?
>
> ERROR
>
> The requested URL could not be retrieved
>
> The following error was encountered while trying to retrieve the URL:
> http://www.twinlakes.k12.wi.us/
>
> Connection to 216.56.4.133 failed.
> The system returned: (110) Connection timed out

I assume that you want to give access to the Internet for all the 
machines in the LAN, through your "PROXY" server. ie., making the server 
an Internet Gateway.

If so, the following should work,

iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -j MASQUERADE

Here, replace the 192.168.1.0/24 with the correct IP address range used 
in your LAN. Please ensure that all the machines have the default route 
pointing to the server.

This allows, all kinds of traffic like http, ftp, ssh etc., to the 
public sites. If necessary, add further iptables rules to restrict this. 
Hope this helps.


Regards,
Vignesh
