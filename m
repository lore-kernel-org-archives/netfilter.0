From: Mohammad Shakir <shakirz1@yahoo.com>
Subject: Connecting Two Network
Date: Tue, 22 Apr 2003 05:33:44 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030422123344.44932.qmail@web40701.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="0-444303205-1051014824=:44486"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

--0-444303205-1051014824=:44486
Content-Type: text/plain; charset=us-ascii
Content-Id: 
Content-Disposition: inline


Dear Experts,

I have two networks running Red Hat Linux 7.3 on both
sites server, now I want to connect each other.

When I send any request from pc-2 to Server2 on port
2000 like this http://202.192.182.2:2000 then server2
forward this request to its internal network pc-3
which is running windows2000 with IIS.

and same on other hand, when pc4 send any request to
Server1 on port 2000 like this
http://202.192.182.1:2000 then server1 forward this
request to its internal network pc-1 which is running
windows2000 with IIS.

the purpose of this task is, to access internal
website which is running on win2k server from
internet.

Is it possible or not ? if not then any other
suggestion.

I am sending herewith my network Image also.

On both linux server I am running this iptables script
to access internet.

iptables --table nat --append POSTROUTING
--out-interface ppp0 -j MASQUERADE
iptables --append FORWARD --in-interface eth0 -j
ACCEPT
echo 1 > /proc/sys/net/ipv4/ip_forward

please guide me if it is possible then what should I
change in my script.


__________________________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo
http://search.yahoo.com
--0-444303205-1051014824=:44486
Content-Type: image/gif; name="mynetwork.GIF"
Content-Transfer-Encoding: base64
Content-Description: mynetwork.GIF
Content-Disposition: inline; filename="mynetwork.GIF"

R0lGODdhkQKpAIAAAAQCBPz+/CwAAAAAkQKpAAAC/4yPqcvtD6OctNqLs968
+w+G4kiW5omm6sq27gvH8kzX9o3n+s73/g8MCofEovF4AyiXzKbzCY1Kp1Fk
gorNardNq/d75IrHZADYYQanv2tv+wyPJ89veaAepuvt/L4LbwQIJ0hEOGQo
hOi3yKihCPSIFOkz2VPJc9moubmQqeOZuMcmyllmelrF6QGKwwpJauVqI1tE
S2Oriiuj+wkr6dvICyMcDBxH/IeqvKymaoDcAu0nvUI9I8j0nN11d3W3na2w
RKH0HFsRro03blKea+yMDm/cZvZW341g731w3z+BLw+5f/kKmjtIwloOhSgY
HpvXrJM4fgfXpPFHUKIEjP+15Jl7JM3hLIjxIoBk14Wbv5TpKDYQ+edlPXDs
Cl6k6Y5BpDowO1SyaFAntZ7XANb8BoghUTcm9QXFt9IlT0RLVRhyhzEqwopo
Bk4shA7lxnbxdhIEekVpyQ2KeEpFePGtU6qM2j7N2A1txpt6x2oM5RWvOpci
qg4D+I/QvhTLGjt+zA1CTqTlIqNledTpA8MNJ0KlyPHuVsFNdR7yqFl00BCc
Y/rNK9nqOw6TsPLTKhpb7EXYUG5LbTAlcMpmXwJGLG5yP+WFyxq1vVl2KZ8W
Fu+dK/hyTrq8IbYuPcpZcdI11U6nDR526tAck+6e5j3Id/Tika//e2I+Y+om
fY//C7iVcKSt9hV8EXX1g36OOPeaPsyNVoKC+fEXnoEVImgJSXZIiAGHEVLI
VHcHRpfhiJt4WN1sbGl4jokY9uJiMTFauOCMg7AI4Ug20tjiiSD22AdkQmaB
WitDHpmKiiH6SBuSTka2lohRTjkCikXKSGWWTGrJZY0XYtllmBuKSaZ9S2pi
ZZlqBrZmmwMGoqSbch7XCoSZkThYnlJt9+A6D7rxZKBpsjZnoactNFpfaOhl
3T2M2pRWgYMaCiSllsK4S2WVfQNXU48C1yho2Bl3aakvmopqUTEAddNHeEHZ
aaKSltfnqamiOumtbVYlIKtv4tfSOtcpSmCOulqa67Fr/y6VVWKvtpQjsbGq
t5p7yqaaSVxp1eagRbUu5+1Uwl57aDTOQiqtabHq1imx45JrarayGpvcsNk9
2peif8K7A1G+QYoUm/5BFxyfn34ELb9ynmTPpgTbdXCAAF9HsasKy3dxxsiC
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
UAUAADs=

--0-444303205-1051014824=:44486--

