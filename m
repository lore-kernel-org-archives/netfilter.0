From: "Ronaldo Alves" <d2suicidal@gmail.com>
Subject: Problem with kernel 2.4.32, iptables 1.3.5 and string module
Date: Mon, 31 Jul 2006 16:54:47 -0300
Message-ID: <597ff3c10607311254w25b7ab38w4dbdf06c4c250581@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Sr(s), ;)
   I have been a problem with this scenario. When I compile iptables,
see this error:
"
extensions/libipt_string.c: In function `init':
extensions/libipt_string.c:66: error: structure has no member named `to_off=
set'
extensions/libipt_string.c:67: error: structure has no member named `to_off=
set'
extensions/libipt_string.c: In function `parse_string':
extensions/libipt_string.c:73: error: `IPT_STRING_MAX_PATTERN_SIZE'
undeclared (first use in this function)
extensions/libipt_string.c:73: error: (Each undeclared identifier is
reported only once
extensions/libipt_string.c:73: error: for each function it appears in.)
extensions/libipt_string.c:74: error: structure has no member named `patter=
n'
extensions/libipt_string.c:74: error: structure has no member named `patter=
n'
extensions/libipt_string.c:74: error: structure has no member named `patter=
n'
extensions/libipt_string.c:75: error: structure has no member named `patlen=
'
extensions/libipt_string.c: In function `parse_algo':
extensions/libipt_string.c:84: error: `IPT_STRING_MAX_ALGO_NAME_SIZE'
undeclared (first use in this function)
extensions/libipt_string.c:85: error: structure has no member named `algo'
extensions/libipt_string.c:85: error: structure has no member named `algo'
extensions/libipt_string.c:85: error: structure has no member named `algo'
extensions/libipt_string.c: In function `parse_hex_string':
extensions/libipt_string.c:131: error: structure has no member named `patte=
rn'
extensions/libipt_string.c:153: error: structure has no member named `patte=
rn'
extensions/libipt_string.c:159: error: structure has no member named `patte=
rn'
extensions/libipt_string.c:162: error: `IPT_STRING_MAX_PATTERN_SIZE'
undeclared (first use in this function)
extensions/libipt_string.c:166: error: structure has no member named `patle=
n'
extensions/libipt_string.c: In function `parse':
extensions/libipt_string.c:189: error: structure has no member named
`from_offset'
extensions/libipt_string.c:196: error: structure has no member named `to_of=
fset'
extensions/libipt_string.c:214: error: structure has no member named `patle=
n'
extensions/libipt_string.c:214: error: structure has no member named `patte=
rn'
extensions/libipt_string.c: In function `print':
extensions/libipt_string.c:304: error: structure has no member named `patte=
rn'
extensions/libipt_string.c:304: error: structure has no member named `patle=
n'
extensions/libipt_string.c:306: error: structure has no member named `patte=
rn'
extensions/libipt_string.c:306: error: structure has no member named `patle=
n'
extensions/libipt_string.c:309: error: structure has no member named `patte=
rn'
extensions/libipt_string.c:309: error: structure has no member named `patle=
n'
extensions/libipt_string.c:311: error: structure has no member named `algo'
extensions/libipt_string.c:312: error: structure has no member named
`from_offset'
extensions/libipt_string.c:313: error: structure has no member named
`from_offset'
extensions/libipt_string.c:314: error: structure has no member named `to_of=
fset'
extensions/libipt_string.c:315: error: structure has no member named `to_of=
fset'
extensions/libipt_string.c: In function `save':
extensions/libipt_string.c:326: error: structure has no member named `patte=
rn'
extensions/libipt_string.c:326: error: structure has no member named `patle=
n'
extensions/libipt_string.c:328: error: structure has no member named `patte=
rn'
extensions/libipt_string.c:328: error: structure has no member named `patle=
n'
extensions/libipt_string.c:331: error: structure has no member named `patte=
rn'
extensions/libipt_string.c:331: error: structure has no member named `patle=
n'
extensions/libipt_string.c:333: error: structure has no member named `algo'
extensions/libipt_string.c:334: error: structure has no member named
`from_offset'
extensions/libipt_string.c:335: error: structure has no member named
`from_offset'
extensions/libipt_string.c:336: error: structure has no member named `to_of=
fset'
extensions/libipt_string.c:337: error: structure has no member named `to_of=
fset'
extensions/libipt_string.c: At top level:
extensions/libipt_string.c:345: error: structure has no member named `confi=
g'
extensions/libipt_string.c:345: error: initializer element is not constant
extensions/libipt_string.c:345: error: (near initialization for
`string.userspacesize')
make: ** [extensions/libipt_string_sh.o] Erro 1
"
 I didn=B4t find nothing similar related? Can you help me?

 regards,
       R.Alves

