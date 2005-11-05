From: Sebastian <seb@exse.net>
Subject: Re: pptp & NAT
Date: Sat, 5 Nov 2005 23:48:18 +0100
Message-ID: <ADACAE55-17E0-4B31-8E24-5A613DDABB96@exse.net>
References: <436ADB4C.7070800@exse.net> <436ADCFB.6070201@snapgear.com>
	<20051105142207.GA29131@domsch.com>
Mime-Version: 1.0 (Apple Message framework v738.1)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051105142207.GA29131@domsch.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: Matt Domsch <matt@domsch.com>
Cc: laforge@netfilter.org, netfilter@lists.netfilter.org, Philip Craig <philipc@snapgear.com>


Am 05.11.2005 um 15:22 schrieb Matt Domsch:
>
>
>>> - I am unable to estabish two pptp connections from one client, I  
>>> can
>>> connect to one pptp server and I can connect to a second pptp  
>>> server,
>>> but the second connection never accepts any traffic, when I stop the
>>> first connection, the second connection begins to work. Is this a  
>>> bug or
>>> a known missing feature ?
>>
>> This is intended to work.  I haven't personally tested it in
>> 2.6.14 though.
>
> Using the endian fix patch and this patch (both are attached to bug
> 397), this is working for me on a 2.6.14 kernel (really, git HEAD from
> yesterday plus these two patches).  I've got 2 clients, one WindowsXP,
> one Fedora Core 4, hitting the same PPTP server at the same time.
> Sincere thanks to both you and Harald for this effort!
>

what is not working for is to connect two pptp-servers from one  
client machine!

/sebastian


