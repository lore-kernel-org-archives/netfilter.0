From: Alexey Talikov <alexey_talikov@texlab.com.uz>
Subject: Re: tcpdump behavior not getting all packets in promisc mode
Date: Mon, 03 Jun 2002 09:47:07 +0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <GAZVTN6M1YT4WFEXT1WGDBAMIJHKH.3cfaf4cb@ALEXEY>
References: <20020603043902.GB19986@cannon.eng.us.uu.net>
Reply-To: alexey_talikov@texlab.com.uz
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020603043902.GB19986@cannon.eng.us.uu.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Transfer-Encoding: 7bit
To: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Cc: netfilter@lists.samba.org, Art Reisman <astormchaser2002@yahoo.com>

See log 
interface realy go to promisc mode
on my linux box
root@shake /root]# tcpdump -n -i eth0
eth0: Promiscuous mode enabled
tcpdump: listening on eth0
in /var/log/messages
Jun  3 08:51:10 shake  -- root[472]: ROOT LOGIN ON tty2
Jun  3 09:42:07 shake sshd(pam_unix)[597]: session opened for user root by (uid=0)
Jun  3 09:42:18 shake kernel: eth0: Promiscuous mode enabled.
Jun  3 09:42:18 shake kernel: device eth0 entered promiscuous mode
Jun  3 09:42:37 shake kernel: device eth0 left promiscuous mode
what version of tcpdump you use (I use last 3.7.1 with libpcap 0.7.1)
I can send you gz archive with compiled version

03.06.2002 9:39:02, Ramin Alidousti <ramin@cannon.eng.us.uu.net> wrote:

>On Mon, Jun 03, 2002 at 09:33:38AM +0500, Alexey Talikov wrote:
>
>> Its issue of switch it create virtual chanell for packet
>> if your ip 192.168.1.2 
>> you can't see packets from 192.168.1.1 to 192.168.1.3 etc
>> only broadcast and arp
>> Solution:
>> use hub or if exist monitoring port on switch
>
>That's what he's been saying (see below). Any other suggestions??
>
>Ramin
>
>> 
>> 03.06.2002 4:52:56, Art Reisman <astormchaser2002@yahoo.com> wrote:
>> 
>> >It is my understanding with my network interface in
>> >promisc mode, that I should be able to see all network
>> >packets on my LAN with tcpdump (no parameters).
>> >
>> >For some reason I am not seeing IP traffic unless it
>> >is destined for me or a broadcast. I replaced my HUB
>> >with very old model to insure that it was not
>> >switched.
>> >
>> >Do I need to restart my interface after setting
>> >promisc mode?
>> >
>> >__________________________________________________
>> >Do You Yahoo!?
>> >Yahoo! - Official partner of 2002 FIFA World Cup
>> >http://fifaworldcup.yahoo.com
>> >
>> 
>> -----------------------------------
>> mailto:alexey_talikov@texlab.com.uz
>> BR
>> Alexey Talikov
>> FORTEK
>> -----------------------------------
>> 
>> 
>

-----------------------------------
mailto:alexey_talikov@texlab.com.uz
BR
Alexey Talikov
FORTEK
-----------------------------------



