From: "G. Skillen" <g@imagination.eu.org>
Subject: NAT and openvpn
Date: Fri, 27 Mar 2009 21:14:04 +0000
Message-ID: <20090327211404.aa4d4e6d.g@imagination.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I have set up a vpn (openvpn) from my home computer to a remote server, I have several unused public IPs on the server and I would like to know how to transparently send all traffic from e.g 123.123.123.123 (one of the spare public ips) to 10.8.0.2 (the vpn ip of my home machine), and vice versa i guess.

Basically my home ISP doesn't allow me any incoming connections so this would be a workaround for me to run a web/ftp server.

Thanks,
G

-- 
G. Skillen <g@imagination.eu.org>
