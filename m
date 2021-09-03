From: martin f krafft <madduck@madduck.net>
Subject: Cannot reference sets in later rules until next nft run
Date: Fri, 3 Sep 2021 13:25:02 +1200
Message-ID: <20210903012502.GA246533@lotus.rw.madduck.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="r5Pyd7+fXNt84Ff3"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=madduck.net;
        s=2015-11-14; t=1630632306;
        bh=j9AvW3/oXxRrxapSvedq4u8g3/yecpKflzLoOvoVPPs=;
        h=Date:From:To:Subject:From;
        b=Tmoiqami27HAxFJ8NOIcVGCpnG0BoFhsIj1IMlT9JWmLMN10m4pN8ZGRXrBtFap4x
         HDkB9iaUkJnZ/hSSKldHAXZW+GRHF65TeM7S238HijfzZyTQb7i04TSRGv/14lB6zi
         tHwm5FtdrBZ3F9Emc6nEJ1fyNzb/HWLp49/jOwNg=
Content-Disposition: inline
List-ID: <netfilter.vger.kernel.org>
To: netfilter users list <netfilter@vger.kernel.org>


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=utf-8; format=flowed; markup=markdown
Content-Disposition: inline

Dear list,

I am trying to create an nft ruleset that uses the include directive 
and a run-parts.d style directory for additions to the main ruleset.

I've run into a problem with nft v0.9.8 on kernel 5.10.0, which I 
summarise as follows: If a rule in the main ruleset defines a set 
then I cannot use that set outside the current scope until a later 
run of nft.

Let me illustrate:

I have the following files (please find them attached):

   ==> inc.d/20-ssh.nft <==
   table inet test {

       set recent_ssh_connections4 { type ipv4_addr; timeout 30s; }

       chain incoming_ssh {
           update @recent_ssh_connections4 { ip saddr } \
               accept comment "SSH connections"
       }

       chain input {
           tcp flags syn tcp dport 22 counter jump incoming_ssh
       }
   }

   ==> inc.d/50-mosh_ports_v4.nft <==
   add rule inet test input \
     ip saddr @recent_ssh_connections4 udp dport 60000-61000 counter accept \
     comment "Portrange required for mosh"

   ==> ruleset.nft <==
   table inet test {

       chain input {
       	type filter hook input priority filter;

       }
   }

   include "./inc.d/*.nft"

When I try to load this ruleset, it fails (debug output is attached):

   % sudo nft -f ruleset.nft In file included from 
   ruleset.nft:9:1-24:
   ./inc.d/50-mosh_ports_v4.nft:2:12-35: Error: No such file or directory
     ip saddr @recent_ssh_connections4 udp dport 60000-61000 counter accept \
              ^^^^^^^^^^^^^^^^^^^^^^^^

If I load the included files with a separate invocation of nft, it 
works:

   % sed '/^include/d' ruleset.nft | sudo nft -f -
   % for f in inc.d/*.nft; do sudo nft -f $f; done

At first, I thought this was a problem with include, but even if I 
replace the include directive with the contents of the files it 
would include, the error is the same.

The error also stays if I convert the command-style content of 
inc.d/50-mosh_ports_v4.nft to the native format.

The only way to make this work is to include the rules within the 
main and first table declaration in ruleset.nft, which means it's 
not possible to use sets in include files.

Is this a bug, or am I doing something wrong?

-- 
@martinkrafft | https://matrix.to/#/#madduck:madduck.net
  
"i can stand brute force, but brute reason is quite unbearable. there
  is something unfair about its use. it is hitting below the
  intellect."
                                                       -- oscar wilde
  
spamtraps: madduck.bogus@madduck.net

--r5Pyd7+fXNt84Ff3
Content-Type: application/gzip
Content-Disposition: attachment; filename="nft-problem-files.tar.gz"
Content-Transfer-Encoding: base64

H4sIAAAAAAAAA+2WTW/iMBCGc+ZXjLgDicnHgUuPPa7U60oo6xhwSxyvPyqhiv++4zQgYIna
Q2B3u/NIUZTYHjt5/Y5nOotuTowUcRzuSZGd3Q9ESZokKSvwSqI4ScIryG6/tCjy1pUGIKrL
qvL8pbffR+3/KNOZVHxa3XQXtPoXn9M/Zznqz3ALkP734KA/iyfWbqZq5YafIwicp2mv/ml+
qf88S1H/ePil/M5/rr8rf2wFSCUcOGEdvI1GgFh8NoIL5Za4LZa8UUpwJxtlU3gDt9M4Rr+m
S/wpZgFO1qLxDuaxXcD+PQLflFJhYN7UUq1DFIwNHV5XpRPw0D+F1GBDcNjD9+OwQMm50A4w
bI1DYfz09AgnY8dt54s1aO9OJndcw2pbri3YnWqfKt0YB4xhIK+cMPDsa3229i7qfvSn9Rqa
g/+zeFI3KEP4E3b5mg6ZCT7yP0vyzv95wRhD/2dZRv6/C/hVYPxZCnj3S3Dd0YS9RvXVwT15
UHKSh8rtaKPOqyHU0a/fsLMp1VpgfvnppREVrBoDYfONv5y7/n6ms6A+pvvbHP0trf/z/vqv
yLKL+n/Okjn5/x70nP/XTs721F/JbXD2pmleumZtZGOk23VNi9HpCUx1xJU6IjBQav1cWv2q
xQtBEARBEARBEARBEARBEARBEFf5BZdIcO0AKAAA

--r5Pyd7+fXNt84Ff3
Content-Type: application/gzip
Content-Disposition: attachment; filename="nft-debug-output.gz"
Content-Transfer-Encoding: base64

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

--r5Pyd7+fXNt84Ff3--

