From: Aleksander Kamenik <aleksander@krediidiinfo.ee>
Subject: Re: ip_forward failing at random times for random amount of time
Date: Tue, 16 Dec 2008 23:09:40 +0200
Message-ID: <49481914.6050209@krediidiinfo.ee>
References: <4946E795.2030602@krediidiinfo.ee>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4946E795.2030602@krediidiinfo.ee>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Well I found the problem.

The central switch/router for some reason forgets its default route 
(3com 4900sx). Thereby making it look like the gateway is dropping 
forwarded packets.

My mistake for not checking for the packets with tcpdump in the first 
place. They simply weren't there, there was nothing for linux to 
forward. Doh.

Thankfully the unit was already scheduled to be replaced soon.

Sorry for the noise.

-- 

Aleksander Kamenik
System Administrator
Krediidiinfo AS
an Experian Company
Phone: +372 665 9649
Email: aleksander@krediidiinfo.ee

http://www.krediidiinfo.ee/
http://www.experiangroup.com/
