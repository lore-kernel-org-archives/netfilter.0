From: Corin Langosch <corinl@gmx.de>
Subject: Re[2]: netmeeting ?
Date: Sun, 16 Jun 2002 20:20:35 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <17730668368.20020616202035@gmx.de>
References: <17729088316.20020616195415@gmx.de>
 <200206161807.g5GI7DA29086@Networker.rockstone.co.uk>
Reply-To: Corin Langosch <corinl@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206161807.g5GI7DA29086@Networker.rockstone.co.uk>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: IP-Tables Maillingliste <netfilter@lists.samba.org>

Hi !

thanks for the fast reply...i'm going to look for these messages.
but i don't really understand the problem. even if netmeeting uses
different ports, it must work i assume, when i forward the traffic
of *all* ports from the caller's ip to my pc behind the fireall.
(this is what my rules do: forward all traffic from a specified ip
execept data on port 80)
or does netmeeting use other protocols than tcp or udp which i
also have to forward ??

thanks,
Corin

Check it out => http://www.find-mich.net

Sunday, June 16, 2002, 8:07:12 PM, you wrote:
AS> On Sunday 16 June 2002 6:54 pm, Corin Langosch wrote:

>> Hi all,
>>
>> im behind a iptables firewall and want to be able to accept incomming
>> netmeeting calls. To make things simple I added the following rules:

AS> [snip]

>> unluckily, no incomming calls are detected and the other party gets an
>> error. other programms like my local ftp server etc. work fine, this means
>> the rules are correct.

AS> It means the rules are correct for ftp, yes, but that's not necessarily true 
AS> for every other protocol you might want to put through your firewall...

AS> Netmeeting is one of those protocols which buries IP addresses & port numbers 
AS> inside the messages, therefore it needs a helper on the firewall to NAT it 
AS> properly.

AS> You should look at the h323 patch in a *very* recent version of netfilter 
AS> (1.2.6a or 1.2.7 from CVS), and also look back through some of the recent 
AS> messages on this mailing list, because there have been a number of posts from 
AS> people trying to get it working / failing to get it working / reporting 
AS> success in getting it working.....

AS> Sorry I can't offer you any direct advice, but I don't use netmeeting - I've 
AS> just seen all the posts on the mailing list from other people who've done the 
AS> same thing you want to.

 

AS> Antony.


