From: Vigneswaran R <vignesh@atc.tcs.com>
Subject: Re: Proxy Filter iptable Settings
Date: Thu, 28 Apr 2011 12:06:22 +0530
Message-ID: <4DB90AE6.9070909@atc.tcs.com>
References: <BANLkTin=W-MWbPfrpqnmWDCMq9fGp5CvwQ@mail.gmail.com>	<1303885014.18916.10.camel@andybev-desktop>	<BANLkTikUnSoefT3Xy=O+43zWGEw3tgb7wQ@mail.gmail.com>	<4DB80945.8040304@atc.tcs.com>	<BANLkTiky5xV9yhr-1nq7cLOSmV1nGt=cKg@mail.gmail.com>	<4DB817A5.3020604@atc.tcs.com> <BANLkTi=y37mzCOenHg8EbR_u9PpoTVceGA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTi=y37mzCOenHg8EbR_u9PpoTVceGA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 04/27/2011 07:11 PM, Mike Hendrie wrote:
> Squid box 172.20.0.3
> All workstations gateway are 172.20.0.3
> All workstations proxy settings are 172.30.0.3:8080
>
> The proxy settings are working fine for blocking content, however, I

Does it mean that the proxy server gives restricted access to the 
Internet for the machines behind it? Can they access the sites like 
google.com (or whatever sites allowed)?

> am having the following issues:
>
> The school's web server is hosted locally. When the workstations try
> to access the site via the public domain name, it fails.

If the answer is 'yes' to the above questions, your machines should be 
able to access the school website as well, through the public IP.

Please ensure that the machines in the LAN are not bypassing the proxy 
for your school website. Because, we tend to bypass proxy for the school 
website (in the browser settings), as it is hosted internally (on your 
LAN, probably on the same machine where squid is running).

Bypassing proxy works, if the Domain Name of your school website is 
resolved into the local address. But, in your case, the Domain Name is 
getting resolved into the public address. So, it should ideally go 
through the proxy server.

Also check, is there any existing iptables rule which is dropping packet 
from your proxy server to your webserver (even if they are on the same 
machine), unintentionally.


Regards,
Vignesh
