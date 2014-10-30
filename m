From: Pietro Paolini <pulsarpietro@aol.com>
Subject: recent module
Date: Thu, 30 Oct 2014 06:35:35 -0400
Message-ID: <8D1C2445F7A6741-7C0-28755@webmail-vm135.sysops.aol.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mx.aol.com;
	s=20140625; t=1414665335;
	bh=uD8ZOZc/fmv/dsIzU569oNq/YzzY7lfquIwhS6VvijY=;
	h=From:To:Subject:Message-Id:Date:MIME-Version:Content-Type;
	b=ELbxLA1WUoFgCESMfiNZ9PgWWlQ9CiH/5yLSoNhqMUIA+FLpF1xyEgVrSWQvEuH/Y
	 Ix5Q0eMQh6BPVl8OAjJScnf6JyfvcsCMlLmqhCcKDIWFSlknhT8DpJzdry4mRrk6nV
	 4K+GvpgDL0m9GzLrYCN/nAoHrOXXInYBg5poH0d8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi all,



I am trying to use the recent module to stop the slate of attacks I get 

everyday, but I am not sure my understanding of its logic it is correct.



-A INPUT -i eth0 -p tcp -m tcp --dport 22 -m state --state NEW -m  

recent --update --seconds 1800 --hitcount 5 --name ssh-defensive 

--rsource -j DROP

-A INPUT -i eth0 -p tcp -m tcp --dport 22 -m state --state NEW -m 

recent --set --name ssh-defensive --rsource



I am testing this solution - which works as intended - but the packet 

counters do not make  sense to me, during my test

I start the ssh client, I get the prompt asking for the password and I 

immediately check the iptables counters:



Chain INPUT (policy ACCEPT 81 packets, 8996 bytes)

  pkts bytes target     prot opt in     out     source               

destination

     1    52 LOG        tcp  --  *      *       0.0.0.0/0            

0.0.0.0/0            state NEW tcp dpt:22 LOG flags 0 level 4

     0     0 DROP       tcp  --  eth0   *       0.0.0.0/0            

0.0.0.0/0            tcp dpt:22 state NEW recent: UPDATE seconds: 1800 

hit_count: 5 name: ssh-defensive side: source

     1    52            tcp  --  eth0   *       0.0.0.0/0            

0.0.0.0/0            tcp dpt:22 state NEW recent: SET name: 

ssh-defensive side: source





I expected to see more packets, what about the TCP handshake ?



Thanks in advance,

Pietro







"And therefore never send to know for whom the bell tolls"

pulsarpietro@aol.com






