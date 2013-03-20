From: Nikolai Zhubr <n-a-zhubr@yandex.ru>
Subject: netfilter+libvirt=(smth got broken?)
Date: Wed, 20 Mar 2013 16:47:15 +0400
Message-ID: <5149AFD3.2070108@yandex.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1363782990;
	bh=Rn1yfWT4aEiTU8/vYZxGq4gBIsmxCUCTBoT6fWqOqrc=;
	h=Message-ID:Date:From:User-Agent:MIME-Version:To:Subject:
	 Content-Type:Content-Transfer-Encoding;
	b=GfyrPtbsvK4Kg928MK/nqjVPxgjyyoMQ79y74lrrxRjEXkBq58G4STKwhvgOPzsD3
	 7QV0ZvI+aKnMzQaMkaWIKLd4mLRp4iEBTyEgk6SsMC1Zo3m90mqJcI0s8YE1Ni49Jy
	 v6Ekce9YJJ/G/hQsaxfdPMKtYEMsTwFVfFaQC58c=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: libvirt-users@redhat.com, netfilter@vger.kernel.org

Hello,

I'm having problem setting up filtering traffic for a virtual machine 
managed by libvirt. Strange thing is, such a setup has been working fine 
for me on an older version of distro (namely, opensuse 11.3  w/updates, 
kernel 2.6.34, libvirt 0.8.8) but refused to work on shiny new opensuse 
12.4 (kernel 3.7.10, libvirt 1.0.2).

The definition of filter in question is pretty simple:

<filter name='some-filt' chain='ipv4'>
   <rule action='accept' direction='in'>
     <tcp dstportstart='110'/>
   </rule>
   <rule action='drop' direction='inout'>
     <all/>
   </rule>
</filter>

So basically it should allow incoming connections to the specified port 
number and nothing else. After activating this filter on a box in 
question, connections to 110 started to fail (timeout). Examining 
iptables rules manually and comparing them to the rules from my old box 
did not reveal anything suspicious to me. However, through just pure 
guesswork, I managed to ocasionally "fix" the problem by manually 
editing 3 relevant rules as follows:

--A FI-vnet0 -p tcp -m tcp --sport 110 -m conntrack --ctstate 
ESTABLISHED -m conntrack --ctdir ORIGINAL -j RETURN
+-A FI-vnet0 -p tcp -m tcp --sport 110 -m conntrack --ctstate 
ESTABLISHED -m conntrack --ctdir REPLY -j RETURN

--A FO-vnet0 -p tcp -m tcp --dport 110 -m conntrack --ctstate 
NEW,ESTABLISHED -m conntrack --ctdir REPLY -j ACCEPT
+-A FO-vnet0 -p tcp -m tcp --dport 110 -m conntrack --ctstate 
NEW,ESTABLISHED -m conntrack --ctdir ORIGINAL -j ACCEPT

--A HI-vnet0 -p tcp -m tcp --sport 110 -m conntrack --ctstate 
ESTABLISHED -m conntrack --ctdir ORIGINAL -j RETURN
+-A HI-vnet0 -p tcp -m tcp --sport 110 -m conntrack --ctstate 
ESTABLISHED -m conntrack --ctdir REPLY -j RETURN

So essentially, just manually swtiching "--ctdir" values to their 
opposites makes the filter allow connections to port 110. I've also 
verified that the filter still blocks unwanted connections originating 
from port 110 from VM exactly as it should:

(in VM): netcat -v -v -n -p 110 192.168.122.1 22
(UNKNOWN) [192.168.122.1] 22 (?) : Connection timed out
  set 0, rcvd 0

I've then compared /proc/net/nf_conntrack on both (old and new) boxes. 
They look roughly the same, nothing suspicious.

This all looks to me as if "--ctdir" argument somehow magically changed 
its meaning to the opposite, but this just cannot be! I'm out of ideas 
and looking for insights. Any hints appreciated quite a lot.

Thank you.
Nikolai


