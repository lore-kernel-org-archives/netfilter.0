From: Vigneswaran R <vignesh@atc.tcs.com>
Subject: Re: Proxy Filter iptable Settings
Date: Fri, 29 Apr 2011 14:46:43 +0530
Message-ID: <4DBA81FB.1030702@atc.tcs.com>
References: <BANLkTin=W-MWbPfrpqnmWDCMq9fGp5CvwQ@mail.gmail.com>	<1303885014.18916.10.camel@andybev-desktop>	<BANLkTikUnSoefT3Xy=O+43zWGEw3tgb7wQ@mail.gmail.com>	<4DB80945.8040304@atc.tcs.com>	<BANLkTiky5xV9yhr-1nq7cLOSmV1nGt=cKg@mail.gmail.com>	<4DB817A5.3020604@atc.tcs.com>	<BANLkTi=y37mzCOenHg8EbR_u9PpoTVceGA@mail.gmail.com>	<4DB90AE6.9070909@atc.tcs.com> <BANLkTikM3czG=D7yq3UHhQdt-pUcjpbKSA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTikM3czG=D7yq3UHhQdt-pUcjpbKSA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

On 04/29/2011 03:13 AM, Mike Hendrie wrote:
> - There is FileMaker application that uses ports 5000 - 5005 to
> connect to an external server that cannot find the external server.
> ??StatefulNAT translation.??

To allow the FileMaker application (client) in your LAN to connect to an 
external server at port 5000-5005, I think, you need to have an ACCEPT 
entry in the FORWARD chain, instead of the INPUT chain (in your iptables).

The image in the following link may help you in understanding the packet 
flow between various chains in iptables.

<http://www.dqd.com/~mayoff/notes/linux/iptables.png>

I don't have any clue about the other problems that you have mentioned. 
Let us hope for some expert to help.


Regards,
Vignesh
