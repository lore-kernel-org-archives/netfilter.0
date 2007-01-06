From: Dave Durkee <dave@enkiconsulting.net>
Subject: Does anyone know how to solve this issue?
Date: Fri, 05 Jan 2007 23:35:01 -0800
Message-ID: <459F5125.50803@enkiconsulting.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I have a sever running Gentoo 2.6.17.  The server motherboard is a Tyan
s2891.  It has dual Broadcom BCM5704 Gigabit nics.  Each nic is auto
sensing 10/100/1000.  When the system is connected to a gigabit switch
and a client machine is connected to the same switch via ssh, all is
well.  Now when the server is set to 100 full duplex, using ethtool, the
server gets all kinds of read errors on the nic and there is a high
amount of retransmissions.

I need to get the server running at 100 because when it goes into the
datacenter, it will be connected to network gear that only talks 100. 
Here is a sniffer trace of the client and server both talking at 1000.

No.     Time        Source                Destination           Protocol
Info
   5132 276.819056  172.16.1.9            172.16.1.5            SSH     
Encrypted response packet len=64
   5133 276.819063  172.16.1.5            172.16.1.9            SSH     
Encrypted request packet len=80
   5134 276.819246  172.16.1.9            172.16.1.5            SSH     
Encrypted response packet len=64
   5135 276.819252  172.16.1.5            172.16.1.9            SSH     
Encrypted request packet len=80
   5136 276.819424  172.16.1.9            172.16.1.5            SSH     
Encrypted response packet len=48
   5137 276.819430  172.16.1.5            172.16.1.9            SSH     
Encrypted request packet len=80
   5138 276.819638  172.16.1.9            172.16.1.5            SSH     
Encrypted response packet len=64
   5139 276.819643  172.16.1.5            172.16.1.9            SSH     
Encrypted request packet len=80
   5140 276.819812  172.16.1.9            172.16.1.5            SSH     
Encrypted response packet len=48
   5141 276.819818  172.16.1.5            172.16.1.9            SSH     
Encrypted request packet len=80
   5142 276.820027  172.16.1.9            172.16.1.5            SSH     
Encrypted response packet len=48
   5143 276.820032  172.16.1.5            172.16.1.9            SSH     
Encrypted request packet len=80
   5144 276.820205  172.16.1.9            172.16.1.5            SSH     
Encrypted response packet len=48
   5145 276.820211  172.16.1.5            172.16.1.9            SSH     
Encrypted request packet len=80
   5146 276.820381  172.16.1.9            172.16.1.5            SSH     
Encrypted response packet len=48
   5147 276.820386  172.16.1.5            172.16.1.9            SSH     
Encrypted request packet len=80
   5148 276.855640  172.16.1.9            172.16.1.5            SSH     
Encrypted response packet len=1448
   5149 276.855761  172.16.1.9            172.16.1.5            SSH     
Encrypted response packet len=1448
   5150 276.855767  172.16.1.9            172.16.1.5            SSH     
Encrypted response packet len=96
   5151 276.855770  172.16.1.5            172.16.1.9            TCP     
42249 > ssh [ACK] Seq=174432 Ack=203056 Win=537 Len=0 TSV=9386546
TSER=3521416
   5152 276.855773  172.16.1.5            172.16.1.9            SSH     
Encrypted request packet len=48
   5153 276.856229  172.16.1.5            172.16.1.9            SSH     
Encrypted request packet len=1360


This is a trace of the server at 100 and the client at 1000.

No.     Time        Source                Destination           Protocol
Info
   5177 276.861590  172.16.1.5            172.16.1.9            SSH     
Encrypted request packet len=80
   5178 276.861696  172.16.1.9            172.16.1.5            SSH     
Encrypted response packet len=64
   5179 276.861702  172.16.1.5            172.16.1.9            SSH     
Encrypted request packet len=80
   5180 276.897482  172.16.1.9            172.16.1.5            TCP     
ssh > 42249 [ACK] Seq=213504 Ack=177120 Win=682 Len=0 TSV=3521421
TSER=9386547
   5181 276.903803  172.16.1.9            172.16.1.5            SSH     
Encrypted response packet len=1448
   5182 276.903809  172.16.1.9            172.16.1.5            SSH     
Encrypted response packet len=40
   5183 276.903813  172.16.1.5            172.16.1.9            TCP     
42249 > ssh [ACK] Seq=177120 Ack=214992 Win=537 Len=0 TSV=9386558
TSER=3521421
   5184 276.903991  172.16.1.5            172.16.1.9            SSH     
Encrypted request packet len=624
   5185 276.903996  172.16.1.5            172.16.1.9            SSH     
Encrypted request packet len=80
   5186 276.903999  172.16.1.9            172.16.1.5            TCP     
ssh > 42249 [ACK] Seq=214992 Ack=177744 Win=705 Len=0 TSV=3521421
TSER=9386558
   5187 276.904012  172.16.1.9            172.16.1.5            TCP     
ssh > 42249 [ACK] Seq=214992 Ack=177824 Win=705 Len=0 TSV=3521421
TSER=9386558
   5188 276.904206  172.16.1.5            172.16.1.9            SSH     
Encrypted request packet len=80
   5189 276.904217  172.16.1.9            172.16.1.5            TCP     
ssh > 42249 [ACK] Seq=214992 Ack=177904 Win=705 Len=0 TSV=3521421
TSER=9386558
   5190 276.904764  172.16.1.5            172.16.1.9            SSH     
Encrypted request packet len=80
   5191 276.904770  172.16.1.9            172.16.1.5            TCP     
ssh > 42249 [ACK] Seq=214992 Ack=177984 Win=705 Len=0 TSV=3521421
TSER=9386558
   5192 276.906470  172.16.1.5            172.16.1.9            SSH     
Encrypted request packet len=80
   5193 276.906476  172.16.1.9            172.16.1.5            TCP     
ssh > 42249 [ACK] Seq=214992 Ack=178064 Win=705 Len=0 TSV=3521421
TSER=9386559
   5194 276.907368  172.16.1.5            172.16.1.9            SSH     
Encrypted request packet len=112
   5195 276.907374  172.16.1.5            172.16.1.9            SSH     
Encrypted request packet len=80
   5196 276.907661  172.16.1.5            172.16.1.9            SSH     
Encrypted request packet len=176
   5197 276.907668  172.16.1.9            172.16.1.5            TCP     
ssh > 42249 [ACK] Seq=214992 Ack=178176 Win=705 Len=0 TSV=3521422
TSER=9386559 SLE=178256 SRE=178432
   5198 276.908433  172.16.1.5            172.16.1.9            SSH     
Encrypted request packet len=912
   5199 276.908440  172.16.1.9            172.16.1.5            TCP     
[TCP Dup ACK 5197#1] ssh > 42249 [ACK] Seq=214992 Ack=178176 Win=705
Len=0 TSV=3521422 TSER=9386559 SLE=178256 SRE=179344
   5200 276.909976  172.16.1.5            172.16.1.9            SSH     
Encrypted request packet len=176
   5201 276.909982  172.16.1.9            172.16.1.5            TCP     
[TCP Dup ACK 5197#2] ssh > 42249 [ACK] Seq=214992 Ack=178176 Win=705
Len=0 TSV=3521422 TSER=9386559 SLE=178256 SRE=179520
   5202 276.909986  172.16.1.5            172.16.1.9            SSH     
[TCP Fast Retransmission] Encrypted request packet len=80
   5203 276.910122  172.16.1.9            172.16.1.5            TCP     
ssh > 42249 [ACK] Seq=214992 Ack=179520 Win=705 Len=0 TSV=3521422
TSER=9386559
   5204 276.955463  172.16.1.9            172.16.1.5            SSH     
Encrypted response packet len=1448
   5205 276.955584  172.16.1.9            172.16.1.5            SSH     
Encrypted response packet len=1448
   5206 276.955590  172.16.1.5            172.16.1.9            TCP     
42249 > ssh [ACK] Seq=179520 Ack=217888 Win=537 Len=0 TSV=9386571
TSER=3521426
   5207 276.955713  172.16.1.9            172.16.1.5            SSH     
Encrypted response packet len=1448
   5208 276.955836  172.16.1.9            172.16.1.5            SSH     
Encrypted response packet len=1448
   5209 276.955841  172.16.1.5            172.16.1.9            TCP     
42249 > ssh [ACK] Seq=179520 Ack=220784 Win=537 Len=0 TSV=9386571
TSER=3521426
   5210 276.956012  172.16.1.9            172.16.1.5            SSH     
Encrypted response packet len=1448
   5211 276.956134  172.16.1.9            172.16.1.5            SSH     
Encrypted response packet len=1448
   5212 276.956139  172.16.1.5            172.16.1.9            TCP     
42249 > ssh [ACK] Seq=179520 Ack=223680 Win=537 Len=0 TSV=9386571
TSER=3521426
   5213 276.956264  172.16.1.9            172.16.1.5            SSH     
Encrypted response packet len=1448
   5214 276.956560  172.16.1.9            172.16.1.5            SSH     
[TCP Previous segment lost] Encrypted response packet len=1448
   5215 276.956566  172.16.1.5            172.16.1.9            TCP     
42249 > ssh [ACK] Seq=179520 Ack=225128 Win=537 Len=0 TSV=9386571
TSER=3521426 SLE=226576 SRE=228024
   5216 276.956689  172.16.1.9            172.16.1.5            SSH     
Encrypted response packet len=1448
   5217 276.956694  172.16.1.5            172.16.1.9            TCP     
[TCP Dup ACK 5215#1] 42249 > ssh [ACK] Seq=179520 Ack=225128 Win=537
Len=0 TSV=9386571 TSER=3521426 SLE=226576 SRE=229472
   5218 276.956867  172.16.1.9            172.16.1.5            SSH     
Encrypted response packet len=1448
   5219 276.956873  172.16.1.5            172.16.1.9            TCP     
[TCP Dup ACK 5215#2] 42249 > ssh [ACK] Seq=179520 Ack=225128 Win=537
Len=0 TSV=9386571 TSER=3521426 SLE=226576 SRE=230920
   5220 276.956876  172.16.1.9            172.16.1.5            SSH     
Encrypted response packet len=552
   5221 276.956879  172.16.1.5            172.16.1.9            TCP     
[TCP Dup ACK 5215#3] 42249 > ssh [ACK] Seq=179520 Ack=225128 Win=537
Len=0 TSV=9386571 TSER=3521426 SLE=226576 SRE=231472
   5222 276.957097  172.16.1.9            172.16.1.5            SSH     
[TCP Fast Retransmission] Encrypted response packet len=1448
   5223 276.957102  172.16.1.5            172.16.1.9            TCP     
42249 > ssh [ACK] Seq=179520 Ack=231472 Win=496 Len=0 TSV=9386571
TSER=3521426
   5224 276.957342  172.16.1.9            172.16.1.5            SSH     
Encrypted response packet len=1448
   5225 276.957348  172.16.1.5            172.16.1.9            TCP     
42249 > ssh [ACK] Seq=179520 Ack=232920 Win=537 Len=0 TSV=9386571
TSER=3521426


Here is the output of netstat:
mercury ~ # netstat -in
Kernel Interface table
Iface     MTU Met   RX-OK  RX-ERR RX-DRP RX-OVR   TX-OK TX-ERR TX-DRP
TX-OVR Flg
eth0       1500   0            401                0              0     
        0              0              0              0              0 BMRU
eth1       1500   0       34385           2084              0           
  0      57857              0              0              0 BMRU
lo         16436   0     160125                 0              0       
      0    160125              0              0              0 LRU

Any and all suggestions will be greatfully appreciated!

Thanks, Dave
 


