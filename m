From: Frank Wunderlich <frank-w@public-files.de>
Subject: nftables portknocking
Date: Sat, 12 Mar 2022 13:01:35 +0100
Message-ID: <trinity-a562df00-31ef-40b9-9a08-4b842eca8f0e-1647086495600@3c-app-gmx-bs23>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1647086495;
        bh=mXUeYi+qINBRmsmK1mgfe7HZe/dvlL10SWB1F3nnZPc=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=fwIuzqaaI9e43SonVpZm8Q513negcp5utKlP3j7LHcHQ2ATqWbE0y/Kq73eMvX5mq
         m0Up3VH9SLGl8Y737t7r8dAEAIiCW+u1ePbeBZDnJBZuzHj7xRh9XTj262F28DfSPT
         pUU9LEN2HHjl8vzMdoYAEEvmCJVt9TkLXm1lEb0U=
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

i want to try portknocking with nftables and found examples here:

https://wiki.nftables.org/wiki-nftables/index.php/Port_knocking_example

there is not much explanation for the examples to understand it right :(

second example looks easier to integrate into existing firewall as the portknocking is separate function but it looks more complex in the knock-steps (each defined separately as var/function) and seems missing the portopening at the end.

this part in example 1:

		tcp dport $guarded_ports ip  saddr @clients_ipv4 counter accept
		tcp dport $guarded_ports ip6 saddr @clients_ipv6 counter accept
		tcp dport $guarded_ports ct state established,related counter accept

		tcp dport $guarded_ports counter reject with tcp reset

i guess it must be placed into Knock_4 {} after the logging, right? and vars need to be changed
clients_ipv4 => Knocked_1

the variables (?) in second example are a bit more complex...this was added in comparision to first

    timeout 10s
    gc-interval 4s

is this needed/preferred? why?

and clients_ipv4 is a better name than Knocked_1 in my opinion, name suggests that the var can hold multiple ip-addresses, right?

maybe its easier to take example 1 and moving the knocking part (input chain without "iifname "lo" return") into own chain like it's done in example2. A bit confusing is that example 2 is ipv4+ipv6 and second is ipv4 only

so currently i ended up with this:

define guarded_ports = {ssh}

table inet portknock {
	set clients_ipv4 {
		type ipv4_addr
		flags timeout
	}

	#set clients_ipv6 {
	#	type ipv6_addr
	#	flags timeout
	#}

	set candidates_ipv4 {
		type ipv4_addr . inet_service
		flags timeout
	}

	#set candidates_ipv6 {
	#	type ipv6_addr . inet_service
	#	flags timeout
	#}

	chain PortKnock {
		tcp dport 123 add @candidates_ipv4 {ip  saddr . 234 timeout 1s}
		#tcp dport 123 add @candidates_ipv6 {ip6 saddr . 234 timeout 1s}
		tcp dport 234 ip  saddr . tcp dport @candidates_ipv4 add @candidates_ipv4 {ip  saddr . 345 timeout 1s}
		#tcp dport 234 ip6 saddr . tcp dport @candidates_ipv6 add @candidates_ipv6 {ip6 saddr . 345 timeout 1s}
		tcp dport 345 ip  saddr . tcp dport @candidates_ipv4 add @candidates_ipv4 {ip  saddr . 456 timeout 1s}
		#tcp dport 345 ip6 saddr . tcp dport @candidates_ipv6 add @candidates_ipv6 {ip6 saddr . 456 timeout 1s}
		tcp dport 456 ip  saddr . tcp dport @candidates_ipv4 add @clients_ipv4 {ip  saddr timeout 10s} log prefix "Successful portknock: "
		#tcp dport 456 ip6 saddr . tcp dport @candidates_ipv6 add @clients_ipv6 {ip6 saddr timeout 10s} log prefix "Successful portknock: "

		tcp dport $guarded_ports ip  saddr @clients_ipv4 counter accept
		#tcp dport $guarded_ports ip6 saddr @clients_ipv6 counter accept
		tcp dport $guarded_ports ct state established,related counter accept

		tcp dport $guarded_ports counter reject with tcp reset
	}

	chain input {
		type filter hook input priority -10; policy accept;

		# allow established/related connections
		ct state established,related accept

		# early drop of invalid connections
		ct state invalid drop

		# allow from loopback
		meta iif lo accept

		# allow icmp #maybe another syntax needed because of ipv4+ipv6
		ip protocol icmp accept

		# port-knocking
		jump PortKnock

		#some other rules
	}
}

is this basicly right? how can this be extended to have multiple guarded_ports with different opening sequences (better defined in an array like type)? Is there such type to define something like this:

guarded_ports {
    22:{123,234,456}
    443:{543,432,321}
}

regards Frank
