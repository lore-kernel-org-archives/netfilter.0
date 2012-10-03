From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: DPI and set's of users.
Date: Wed, 03 Oct 2012 13:04:03 +0200
Message-ID: <506C1BA3.7050106@ngtech.co.il>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I managed to use opendpi for Deep packets inspection and it seems to be 
more suitable then other layer 7 DPI solutions.

I have 9 categories of connections such as p2p messenger etc and I have 
ip addresses of users that can or cant use the service.
basically the rule is to block service unless I allow the specific IP.
but there is a big list of IP addresses and I need to update them on 6 
machines when I change anything and needs to be effecting immediately.
what is the best tool to manage big lists of IP's and to match them to a 
rule?
it seems to me the best choice is ipset ? but I didnt understood how to 
use it?

Thanks,
Eliezer

-- 
Eliezer Croitoru
https://www1.ngtech.co.il
IT consulting for Nonprofit organizations
eliezer <at> ngtech.co.il
