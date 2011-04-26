From: Vigneswaran R <vignesh@atc.tcs.com>
Subject: Re: Using source nat to discriminate traffic
Date: Tue, 26 Apr 2011 17:32:57 +0530
Message-ID: <4DB6B471.7000805@atc.tcs.com>
References: <4DB68B40.2030806@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DB68B40.2030806@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 04/26/2011 02:37 PM, carlopmart wrote:
> - BBDD_1 can only be accessed by ip address 172.21.2.2.
> - BBDD_2 can only be accessed by ip address 172.21.2.3
>
> Both ip address, 172.21.2.2 and 172.21.2.3, are assigned to the first
> host that acts as a mysql client. Latest release of mysql client

IMHO, if both the IPs are bound to the same host in a permanent basis, 
it would be better (request the admin) to change the ACLs so that both 
the databases (BBDD_1 and BBDD_2) are allowed from the same IP (either 
172.21.2.2 or 172.21.2.3). Then as you know, your iptables rule will 
work for both databases.


Regards,
Vignesh
