From: purushotham.krishnappa@philips.com
Subject: problem with ip tables help required
Date: Fri, 7 Feb 2003 11:26:21 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF56582234.0D18279E-ON65256CC6.00202B97-65256CC6.00203F99@diamond.philips.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; 
	Boundary="0__=EABBE655DFB3AD078f9e8a93df938690918cEABBE655DFB3AD07"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

--0__=EABBE655DFB3AD078f9e8a93df938690918cEABBE655DFB3AD07
Content-type: text/plain; charset=us-ascii

Hi


The requirement is like this


              WebServer-------------------- - ----Router/Firewall---------------------------------------client
            10.60.90.7/8            eth1                  eth0                                         192.168.10.15
                              10.60.90.5/8                 192.168.10.5/24



Router/Firewall ----->RH linux 8 using iptables

client should be able to access the webserver
With out firewall rule i am able to access webserver  from client (ip forwarding is working fine)


I have already set iptable rule pls see the attached file


after FW rule is enable

i am not able to connect to webserver from 192.168.10.5  to 10.60.90.7    BUT i can ping 10.60.90.5
I need clients to connect from 192.168.10.0/24  to able to connect to only port 80 on 10.161.90.7.8

(See attached file: firescript.txt)
Rgds
Puru

--0__=EABBE655DFB3AD078f9e8a93df938690918cEABBE655DFB3AD07
Content-type: text/plain; 
	name="firescript.txt"
Content-transfer-encoding: base64

IyAoMSkgUG9saWNpZXMgKGRlZmF1bHQpDQppcHRhYmxlcyAtUCBJTlBVVCBEUk9QDQppcHRhYmxl
cyAtUCBPVVRQVVQgRFJPUA0KaXB0YWJsZXMgLVAgRk9SV0FSRCBEUk9QDQoNCiMgKDIpIFVzZXIt
ZGVmaW5lZCBjaGFpbiBmb3IgQUNDRVBURUQgVENQIHBhY2tldHMNCmlwdGFibGVzIC1OIG9rYXkN
CmlwdGFibGVzIC1BIG9rYXkgLXAgVENQIC0tc3luIC1qIEFDQ0VQVA0KaXB0YWJsZXMgLUEgb2th
eSAtcCBUQ1AgLW0gc3RhdGUgLS1zdGF0ZSBFU1RBQkxJU0hFRCxSRUxBVEVEIC1qIEFDQ0VQVA0K
aXB0YWJsZXMgLUEgb2theSAtcCBUQ1AgLWogRFJPUA0KDQojICgzKSBJTlBVVCBjaGFpbiBydWxl
cw0KIyBSdWxlcyBmb3IgaW5jb21pbmcgcGFja2V0cyBmcm9tIExBTg0KaXB0YWJsZXMgLUEgSU5Q
VVQgLXAgQUxMIC1pIGV0aDEgLXMgMTAuMC4wLjAvOCAtaiBBQ0NFUFQNCmlwdGFibGVzIC1BIElO
UFVUIC1wIEFMTCAtaSBsbyAtcyAxMjcuMC4wLjEgLWogQUNDRVBUDQppcHRhYmxlcyAtQSBJTlBV
VCAtcCBBTEwgLWkgbG8gLXMgMTAuNjAuOTAuNSAtaiBBQ0NFUFQNCmlwdGFibGVzIC1BIElOUFVU
IC1wIEFMTCAtaSBsbyAtcyAxOTIuMTY4LjEwLjUgLWogQUNDRVBUDQppcHRhYmxlcyAtQSBJTlBV
VCAtcCBBTEwgLWkgZXRoMSAtZCAxMC4wLjAuMjU1IC1qIEFDQ0VQVA0KDQojIFJ1bGVzIGZvciBp
bmNvbWluZyBwYWNrZXRzIGZyb20gdGhlIGludGVybmV0DQoNCiMgUGFja2V0cyBmb3IgZXN0YWJs
aXNoZWQgY29ubmVjdGlvbnMNCmlwdGFibGVzIC1BIElOUFVUIC1wIEFMTCAtZCAxOTIuMTY4LjEw
LjUgLW0gc3RhdGUgLS1zdGF0ZSBFU1RBQkxJU0hFRCxSRUxBVEVEIC1qIEFDQ0VQVA0KDQojIFRD
UCBydWxlcw0KaXB0YWJsZXMgLUEgSU5QVVQgLXAgVENQIC1pIGV0aDAgLXMgMC8wIC0tZGVzdGlu
YXRpb24tcG9ydCA4MCAtaiBva2F5DQoNCiMgSUNNUCBydWxlcw0KaXB0YWJsZXMgLUEgSU5QVVQg
LXAgSUNNUCAtaSBldGgwIC1zIDAvMCAtLWljbXAtdHlwZSA4IC1qIEFDQ0VQVA0KaXB0YWJsZXMg
LUEgSU5QVVQgLXAgSUNNUCAtaSBldGgwIC1zIDAvMCAtLWljbXAtdHlwZSAxMSAtaiBBQ0NFUFQN
Cg0KIyAoNCkgRk9SV0FSRCBjaGFpbiBydWxlcw0KIyBBY2NlcHQgdGhlIHBhY2tldHMgd2Ugd2Fu
dCB0byBmb3J3YXJkDQppcHRhYmxlcyAtQSBGT1JXQVJEIC1pIGV0aDEgLWogQUNDRVBUDQppcHRh
YmxlcyAtQSBGT1JXQVJEIC1tIHN0YXRlIC0tc3RhdGUgRVNUQUJMSVNIRUQsUkVMQVRFRCAtaiBB
Q0NFUFQNCg0KIyAoNSkgT1VUUFVUIGNoYWluIHJ1bGVzDQojIE9ObHkgb3V0cHV0IHBhY2tldHMg
d2l0aCBsb2NhbCBhZGRyZXNzIChubyBzcG9vZmluZykNCmlwdGFibGVzIC1BIE9VVFBVVCAtcCBB
TEwgLXMgMTI3LjAuMC4xIC1qIEFDQ0VQVA0KaXB0YWJsZXMgLUEgT1VUUFVUIC1wIEFMTCAtcyAx
MC42MC45MC41IC1qIEFDQ0VQVA0KaXB0YWJsZXMgLUEgT1VUUFVUIC1wIEFMTCAtcyAxOTIuMTY4
LjEwLjUgLWogQUNDRVBUDQoNCiMgKDYpIGR5bmFtaWMgTkFUIHRvIGRvIHBvcnQgZm9yd2FyZGlu
Zw0KaXB0YWJsZXMgLXQgbmF0IC1BIFBSRVJPVVRJTkcgLXAgdGNwIC1kIDE5Mi4xNjguMTAuNSAt
LWRwb3J0IDgwIC1qIEROQVQgLS10by1kZXN0aW5hdGlvbiAxMC42MC45MC43DQo=

--0__=EABBE655DFB3AD078f9e8a93df938690918cEABBE655DFB3AD07--


