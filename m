From: "Saber zrelli" <saber_z@fastmail.fm>
Subject: newbie question about kernel networking
Date: Sat, 20 Mar 2004 22:06:11 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1079787971.1673.183015624@webmail.messagingengine.com>
References: <20040320002512.GC3373@salty>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040320002512.GC3373@salty>
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

hi people ,
my question is simple :
if i use some packet injection library like libnet to send a packet from
host A to host B , and libpcap to capture packets and monitor all network
traffik.
let's say i send TCP SYN packet (like if my host is establishing a TCP
connection with host B ), the host may answer with a SYN packet accepting
my connection , then two possibilities :

1 - the kernel will send RST packet to the host B coz the SYN packet from
host B be is assimilated as connection establishment
    request to a non existant service.
2 - the libpcap tool im using acts as a service and the kernel just
deliver the SYN packet from B to my sniffing tool without     
    taking any action like in 1.

in case 1 the kernel will generate an extra trafic i dont need .
in case 2 it acts transparently.

i think that case 2 is more correct , but i'm not sure.


Any comments greatly appreciated.

Regards.
-- 
  Saber Zrelli
  kanazawa university international house 
  kakuma-machi , kanazawa , Ishikawa 
  920-1192 Japan. 

