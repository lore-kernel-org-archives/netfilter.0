From: =?iso-8859-1?Q?Gast=F3n?= Franco <gfranco@arcert.gov.ar>
Subject: Re: Spoofed ip's
Date: Tue, 11 Feb 2003 16:22:50 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E494D8A.10815735@arcert.gov.ar>
References: <1044948351.23287.11.camel@filth.sadomain.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: deff <deff@sadomain.co.za>
Cc: netfilter@lists.netfilter.org

Hi .!
The  list of networks reserved by IANA.
can be found at:
http://www.iana.org/assignments/ipv4-address-space

( for additional information see RFC3330 )


deff wrote:

> Hello everyone.
>
> I set up a firewall that filters out, logs, and drops packets
> originating from spoofed ip addresses.
>
> The definition here of a spoofed ip is :
> a) A non-routable ip
> b) A ip thats not destined for us ( shouldn't get past router anyway )
> c) A local ip
> d) the loop back ip
>
> Originally the firewall only filtered 172.16.0.0/12, 192.168.0.0/16,
> 10.0.0.0/8 and 127.0.0.1 addresses.
>
> Then i took a look at Firestarter's iptables script and saw that it als=
o
> filters out other addresses.
>
> Could anyone please check the rules below and tell me if the the source=

> ip'ss are valid. I'm seeing an incredible amount of these ip's
> attempting to get through .
>
> To me it looks like i'm blocking out the whole internet, but that makes=

> me wonder why firestarter does it .
>
> thanks ,
> Cilli=C3=A9
>
> ______________________CUT____________________________
>
> iptables --append spoofed_ip --source 1.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 2.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 5.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 7.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 23.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 27.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 31.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 36.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 37.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 39.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 41.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 42.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 58.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 59.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 60.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 69.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 70.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 72.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 73.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 74.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 75.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 76.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 77.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 78.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 79.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 82.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 83.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 84.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 85.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 86.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 87.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 89.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 90.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 91.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 92.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 93.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 94.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 95.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 96.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 97.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 98.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 99.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 100.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 101.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 102.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 103.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 104.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 105.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 106.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 107.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 108.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 109.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 110.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 111.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 112.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 113.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 114.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 115.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 116.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 117.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 118.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 119.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 120.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 121.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 122.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 123.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 124.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 125.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 126.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 128.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 128.66.0.0/16 --jump spoof_log
> iptables --append spoofed_ip --source 192.168.0.0/16 --jump spoof_log
> iptables --append spoofed_ip --source 172.16.0.0/12 --jump spoof_log
> iptables --append spoofed_ip --source 221.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 197.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 222.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 223.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 240.0.0.0/4 --jump spoof_log
>
> ______________________CUT___________________________

--
---------------------------------------------------------
                     ArCERT
 Te:(54-11) 43439001 int.514    Fax:(54-11) 4343-7458
 e-mail: gfranco@arcert.gov.ar  http://www.arcert.gov.ar
 Av.R. Saenz Pe=F1a 511 Of 514    Cap.Fed. - Argentina
---------------------------------------------------------



