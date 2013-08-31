From: Nick Edwards <nick.z.edwards@gmail.com>
Subject: automatic helper assignment is deprecated and it will be removed soon
Date: Sat, 31 Aug 2013 16:09:17 +1000
Message-ID: <CAMD-=V+QAVw23X9eSAuzF4nz0kH0+vw0Om46+ofr0EGMVW6PNA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=jMTr4J80x3LWEq4J+W1RbXQ1gtfVhu9sq4bkHT6p2iQ=;
        b=ze2XVs+txrPF/qA6Tbbd57ybsZ2avm3CVtR2NnNS8wgpaWQFdRctEPqAKLy3eJcp3y
         tHWvc7IimJfTm1v/esSREvPJOPfLr+RsB7rtInuvDaZUkDUy2CXqalBEo/cKc3c8brjX
         8dOVDWzLApI9i9t1apGQONOujYJIkczVaIb4VaiaULmpKRXP6EN3Uz0dYGaYGet+6ZF4
         1m8RAO/MP51ML+g0em4v3IZ/HH46F1G8CyihyciDQmhBNk9jivAgdu9hG1NyJQT6y50W
         1SVOOU69N9V9liHrllg4Ej4LCFZJB1q7OHAGO3rntjtzoBhOPmRLicAVa8uzMVo6gi0L
         3kWw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter user mailing list <netfilter@vger.kernel.org>

Hi,
 This message is now appearing on some of our servers..
google is full of much info, and confusion.

I understand it to be
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
becomes
iptables -A INPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT

with new rules to add being
-A FORWARD -m conntrack --ctstate RELATED -m helper --helper ftp -p
tcp --dport 21 -j ACCEPT

then some sites talk about
 -A PREROUTING -t raw -p tcp --dport 21 -j CT --helper ftp

So, does removal of ESTABLISHED on original rules, now mean we need
one of, of both of, these new rules?

I tried on our IRC server, but it balked with ip6tables  at xt_CT: No
such helper "irc"
same command with iptables seemed to take..

What is the correct way to replace this ESTABLISED since nf_conntrack
will soon be removed

Are they even needed anymore?  (I think irc helper is only needed for dcc etc)
 is FTP still  needed for ftp?

WTF kernel TINKERERS cant leave things alone i'll never know.
