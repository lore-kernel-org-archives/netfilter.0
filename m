From: JHoskins98@aol.com
Subject: Re: what traffic is this?
Date: Wed, 26 Jun 2002 09:25:34 EDT
Sender: netfilter-admin@lists.samba.org
Message-ID: <fd.19d60313.2a4b1ace@aol.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="part1_fd.19d60313.2a4b1ace_boundary"
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: netfilter@lists.samba.org


--part1_fd.19d60313.2a4b1ace_boundary
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

The traffic is CDP - Cisco Discovery Protocol.  It is a heartbeat to detect 
changes i.e. newly attached or detacted cisco equipment.  

You can turn it off with "no cdp run" command at the enable prompt or "no cdp 
enable" at the interface.  
jhh

In a message dated 6/26/2002 7:37:06 AM Eastern Standard Time, 
netfilter-request@lists.samba.org writes:


> This traffic comes from a cisco router.
> what type of traffic is ?
> 
> [root@cuelebre root]# tcpdump -i eth2
> tcpdump: listening on eth2
> 
> 13:19:12.640000 0:4:dd:c:42:a6 0:4:dd:c:42:a6 loopback 60:
>                          0000 0100 0000 0000 0000 0000 0000 0000
>                          0000 0000 0000 0000 0000 0000 0000 0000
>                          0000 0000 0000 0000 0000 0000 0000
> 13:19:22.640000 0:4:dd:c:42:a6 0:4:dd:c:42:a6 loopback 60:
>                          0000 0100 0000 0000 0000 0000 0000 0000
>                          0000 0000 0000 0000 0000 0000 0000 0000
>                          0000 0000 0000 0000 0000 0000 0000


--part1_fd.19d60313.2a4b1ace_boundary
Content-Type: text/html; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

<HTML><FONT FACE=arial,helvetica><BODY BGCOLOR="#3dffff"><FONT  SIZE=2 FAMILY="SANSSERIF" FACE="Arial" LANG="0">The traffic is CDP - Cisco Discovery Protocol.&nbsp; It is a heartbeat to detect changes i.e. newly attached or detacted cisco equipment.&nbsp; <BR>
<BR>
You can turn it off with "no cdp run" command at the enable prompt or "no cdp enable" at the interface.&nbsp; <BR>
jhh<BR>
<BR>
In a message dated 6/26/2002 7:37:06 AM Eastern Standard Time, netfilter-request@lists.samba.org writes:<BR>
<BR>
<BR>
<BLOCKQUOTE TYPE=CITE style="BORDER-LEFT: #0000ff 2px solid; MARGIN-LEFT: 5px; MARGIN-RIGHT: 0px; PADDING-LEFT: 5px">This traffic comes from a cisco router.<BR>
what type of traffic is ?<BR>
<BR>
[root@cuelebre root]# tcpdump -i eth2<BR>
tcpdump: listening on eth2<BR>
<BR>
13:19:12.640000 0:4:dd:c:42:a6 0:4:dd:c:42:a6 loopback 60:<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0000 0100 0000 0000 0000 0000 0000 0000<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0000 0000 0000 0000 0000 0000 0000 0000<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0000 0000 0000 0000 0000 0000 0000<BR>
13:19:22.640000 0:4:dd:c:42:a6 0:4:dd:c:42:a6 loopback 60:<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0000 0100 0000 0000 0000 0000 0000 0000<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0000 0000 0000 0000 0000 0000 0000 0000<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0000 0000 0000 0000 0000 0000 0000</BLOCKQUOTE><BR>
<BR>
</FONT></HTML>
--part1_fd.19d60313.2a4b1ace_boundary--

