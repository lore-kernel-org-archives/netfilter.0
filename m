From: Harald Dunkel <harald.dunkel@aixigo.com>
Subject: Re: WARNING: CPU: 9 PID: 0 at net/netfilter/nf_conntrack_core.c:977
 __nf_conntrack_confirm+0x4e5/0x6f0 [nf_conntrack]
Date: Sat, 23 Nov 2019 14:21:25 +0100
Message-ID: <d4656ade-d2fd-92fc-0f3e-5abb7c3f01e2@aixigo.com>
References: <e6eaa72a-08f3-9645-d37b-6367eee90078@aixigo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <e6eaa72a-08f3-9645-d37b-6367eee90078@aixigo.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

PS: Platform is Debian 10.2. Docker is version 18.06.1~ce~3-0~debian.

I had setup a macvlan using

	docker network create -d macvlan -o parent=br0 --subnet=172.19.96.0/20 greylan

/etc/network/interfaces:

	auto eth0
	iface eth0 inet manual

	auto br0
	iface br0 inet static
	        address 172.19.96.191/20
	        gateway 172.19.96.1
	        bridge_ports eth0
	        bridge_stp off
	        bridge_waitport 0

There was one Docker container running. compose file:

	version: '3.7'
	services:
	  jenkins:
	    image: jenkins/jenkins:lts
	    container_name: jenkins
	    environment:
	      - JAVA_OPTS=-Xmx2G
	      - JENKINS_OPTS=--httpsPort=8443 --httpsPrivateKey=/var/jenkins_home/ssl/platjenkins.key.pem --httpsCertificate=/var/jenkins_home/ssl/platjenkins.cert.pem
	    ports:
	      - "8443:8443"
	      - "50000:50000"
	    volumes:
	      - /export/docker-persistent/jenkins_home:/var/jenkins_home
	    networks:
	      greylan:
	         ipv4_address: 172.19.96.46
	    restart: unless-stopped

	networks:
	  greylan:
	    external: true


Please note the port mapping lines that were kept by accident. Since I
omitted these lines there was no hiccup anymore


Regards
Harri
