From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Continuous attempt to connect to UDP port 2002
Date: Mon, 16 Sep 2002 20:15:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020916191539.UFQI14766.mta05-svc.ntlworld.com@there>
References: <C10C67C29E56FE48A787648B25C5A8CD9BFB@hercules.idea.com.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <C10C67C29E56FE48A787648B25C5A8CD9BFB@hercules.idea.com.mx>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Monday 16 September 2002 5:33 pm, Omar Castaneda Acosta wrote:

> Has anyone experienced this?
>
> Sep 16 11:09:41 myhost kernel: Bad: IN=eth2 OUT=
> MAC=00:e0:81:10:85:85:00:60:5c:f3:eb:f7:08:00 SRC=148.247.40.15
> DST=148.223.7.178 LEN=69 TOS=0x00 PREC=0x00 TTL=52 ID=0 DF PROTO=UDP
> SPT=2002 DPT=2002 LEN=49

I haven't experienced it myself, but it looks like it's either a Trojan Horse 
called TransScout, or a worm called Slapper:

http://www.by-users.co.uk/faqs/security/whchport
http://www.securezone.it/trojan/th10.htm
http://www.simplelogic.org/oddports.html

http://www.glocksoft.com/trojan_list/TransScout.htm

http://www.sophos.co.uk/virusinfo/analyses/linuxslappera.html
http://securityresponse.symantec.com/avcenter/security/Content/2002.09.13.html

Looks like you're not the only one seeing it, either:

http://isc.incidents.org/port_details.html?port=2002

Antony.

-- 

Behind the counter a boy with a shaven head stared vacantly into space,
a dozen spikes of microsoft protruding from the socket behind his ear.

 - William Gibson, Neuromancer

