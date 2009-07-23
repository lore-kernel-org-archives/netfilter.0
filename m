From: Jamie Orzechowski <jamie.orzechowski@gmail.com>
Subject: IPTables forward before redirection
Date: Thu, 23 Jul 2009 13:14:34 -0400
Message-ID: <a32a580b0907231014r21946493mabe5e31e58aeae8d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=HOkWpEgD7HReEsWUPAzuqlGqImJaWm/Z/L7idyP5dac=;
        b=eTKpngVHxkpbCiBN4zYstlWIQJQWzsTZMuKRvlDh5GELxnMcGNcC6LvSyvX28fBzGg
         mtvUTKi+blsqbUafo17NSeRjXbujFjB7LEyxoNtj6JFrYCCrWSUJiZCsIqblEIvMs5sG
         NKcMhPs+SfiYw+ILFcOZdwT2s9u+a7kacTExY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I am running Squid Cache with TPROXY Support ... the problem is my
iptables rules are passing all port 80 traffic to squid.  I want to
add a rule to bypass a local subnet so it is not intercepted and goes
direct to the destination ... here is my rule but it's not working ..
it's still being intercepted.  All traffic occurs on eth1 ... any
ideas?

iptables -t mangle -N DIVERT
iptables -t mangle -A DIVERT -j MARK --set-mark 1
iptables -t mangle -A DIVERT -j ACCEPT

#Bypass This destination
iptables -t mangle -A PREROUTING -p tcp -m tcp -i eth1 --dport 80 -d
66.78.96.0/255.255.255.0 -j ACCEPT

iptables -t mangle -A PREROUTING -p tcp -m socket -j DIVERT
iptables -t mangle -A PREROUTING -p tcp --dport 80 -j TPROXY
--tproxy-mark 0x1/0x1 --on-port 3129 --on-ip 66.78.102.2
