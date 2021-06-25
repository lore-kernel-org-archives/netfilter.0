From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Reload IPtables
Date: Sat, 26 Jun 2021 01:43:08 +0200
Message-ID: <877683bf-6ea4-ca61-ba41-5347877d3216@thelounge.net>
References: <08f069e3-914f-204a-dfd6-a56271ec1e55.ref@att.net>
 <08f069e3-914f-204a-dfd6-a56271ec1e55@att.net>
 <4ac5ff0d-4c6f-c963-f2c5-29154e0df24b@hajes.org>
 <6430a511-9cb0-183d-ed25-553b5835fa6a@att.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <6430a511-9cb0-183d-ed25-553b5835fa6a@att.net>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: slow_speed@att.net, David Hajes <david@hajes.org>, netfilter@vger.kernel.org



Am 25.06.21 um 23:30 schrieb slow_speed@att.net:
> I do not believe it is something one would use a script for. Rather, 
> there should be a way to reload the information into memory without 
> having to reboot.

why would you ever reboot a linux system for something trivial than 
exchange, reset or realod iptables?

* you have your ruleset
* you have saved it
* just load it

"/usr/sbin/iptables-nft-restore /etc/sysconfig/iptables" or 
"iptables-restore" or "iptables-legacy-restore"

there is no difference doing that at boot or any moment in time

> On 6/25/21 4:51 PM, David Hajes wrote:
>> on Debian I flushed all tables including custom tables and used to run 
>> iptables bash script before I moved to nftables. OpenBSD same strategy 
>> - flush and reload pf.conf
>>
>> if that is what you mean by reload.
>>
>> On 25/06/2021 21:24, slow_speed@att.net wrote:
>>> What is the preferred command to reload the current rules for 
>>> iptables? (Please include Debian environment, if distro-specific.)
